resource "aws_instance" "expense" {
  # for_each = var.instances
  ami                   = data.aws_ami.pavan.id
  instance_type         = "t3.micro" #each.value
  vpc_security_group_ids = [aws_security_group.expense.id]

  tags = var.tags
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",
        ]
    }

    provisioner "remote-exec" {
        when    = destroy
        inline = [
            "sudo systemctl stop nginx",
        ]
    }
}

resource "aws_security_group" "expense" {
  name        = var.sg_name
  description = var.sg_desctiption

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.tags,
   {
    Name = "expense"
   }
  )
}