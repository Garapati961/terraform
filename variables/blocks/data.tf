data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name  = "name"
    value = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name  = "root_device_type"
    value = ["ebs"]
  }
  filter {
    name  = "virtualization_type"
    value = ["hvm"]
  }
  filter {
    name  = "architecture"
    value = ["x86_64"]
  }
}