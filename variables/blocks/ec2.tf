resource "aws_instance" "server-1" {
  ami = "data.aws_ami.amazon.id"
  instance_type = "var.aws_instance_type"
  availability_zone = "us-east-1a"
  count = 5
  tags = {
    "Name" = server-1-${count.index}
  }
}