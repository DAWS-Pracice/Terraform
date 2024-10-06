variable "ami-id"{
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type"{
    # default = []
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
    default = "allow-sshh"
}

variable "sg_desctiption"{
    default = "allow port number 22 for ssh access"
}