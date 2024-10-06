variable "ami-id"{
    default = "ami-09c813fb71547fc4f"
}

variable "environment"{
    default = "dev"
}

# variable "instance_names"{
#     default = ["myaql", "backend", "frontend"]
# }

# variable "instances" {
#     default = {
#          mysql = "t3.small"
#          backend = "t3.micro"
#          frontend = "t3.micro"
#     }
# }


variable "tags" {
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "sg_name"{
    default = "expense"
}

variable "sg_desctiption"{
    default = "allow port number 22 for ssh access"
}

# variable "zone_id"{
#     default = "Z04609323L33TMWTNO2EZ"
# }

# variable "domai_name"{
#     default = "pdevops.online"
# }

# variable "ec2_user_password" {
#     default = "DevOps321"
# }

variable "ingress_rules" {
    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "opening 22"
        },
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "opening 80"
        },
        {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "opening 8080"
        }
    ]
}