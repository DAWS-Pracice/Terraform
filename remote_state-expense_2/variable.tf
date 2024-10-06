variable "ami-id"{
    default = "ami-09c813fb71547fc4f"
}

variable "environment"{
    default = "prod"
}

variable "instance_names"{
    default = ["myaql", "backend", "frontend"]
}


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