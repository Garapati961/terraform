resource "aws_vpc" "dev-vpc"{
    for_each ={
        vpc1 = "0.0.0.0/16"
        vpc2 = "10.0.0.0/16"
        vpc3 = "101.0.0.0/16"
    }
    cidr_block = each.value
    tags = {
        Name = "dev-vpc-${each.key}"
    }
    lifecycle {
        create_before_destroy = true
        prevent_destroy = true
        
    }
}