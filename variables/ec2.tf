resource "aws_instance" "server-1"{
    ami = "ami-081b0a6eac00b4f53"
    instance_type = var.instance_type
    count = var.instance_count
    associate_public_ip_address = var.instance_public_ip_address
    subnet_id = "subnet-087b81fadfbdfbe05"
    key_name = "bun"
    tags = {
        Name = "server-1"
    }

}