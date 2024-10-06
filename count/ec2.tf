resource "aws_instance" "terraform" {
  count = length(var.instance_names)
  ami                   = var.ami-id
  instance_type         = var.environment == "prod" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-sshh.id]

  tags = merge(
    var.tags,
   {
    Name = var.instance_names[count.index]
   }
  )
}

resource "aws_security_group" "allow-sshh" {
  name        = var.sg_name
  description = var.sg_desctiption

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
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
    Name = "allow-sshh"
   }
  )
}