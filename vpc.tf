
resource "aws_vpc" "satya_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "satya_vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.satya_vpc.id
  cidr_block = "10.0.1.0/24"
}
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.satya_vpc.id
}
resource "aws_route_table" "vpc_route_table" {
  vpc_id = aws_vpc.satya_vpc.id
}
resource "aws_route" "vpc_route" {
  route_table_id         = aws_route_table.vpc_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_igw.id
}
resource "aws_route_table_association" "vpc_route_pulic_association" {
  route_table_id = aws_route_table.vpc_route_table.id
  subnet_id      = aws_subnet.public-subnet.id
}
resource "aws_security_group" "vpc_sg" {
  name        = "vpc-project-sg"
  description = "vpc_sg group"
  vpc_id      = aws_vpc.satya_vpc.id

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}