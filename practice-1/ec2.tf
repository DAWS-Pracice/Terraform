resource "aws_instance" "expense" {
  for_each = var.instances
  ami                   = data.aws_ami.pavan.id
  instance_type         = each.value
  vpc_security_group_ids = [aws_security_group.expense.id]

  tags = merge(
    var.tags,
   {
    Name = each.key
   }
  )
}

resource "aws_security_group" "expense" {
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
    Name = "allow-ssh"
   }
  )
}