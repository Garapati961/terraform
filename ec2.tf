resource "aws_instance" "web" {
  ami                         = "ami-081b0a6eac00b4f53"
  instance_type               = "t3.micro"
  key_name                    = "bun"
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.vpc_sg.id]
}
