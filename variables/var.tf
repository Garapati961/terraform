variable "instance_type"{
    type = string
    default = "t3.micro"
}
variable "instance_count"{
    type = number
    default = 2
}
variable "instance_public_ip_address"{
    type = bool
    default = true
}
variable "availability_zone"{
    type = list(string)
    default = [
        "us-east-1a",
        "us-east-1b",
        "us-east-1c",
        "us-east-1d"
    ]
}

