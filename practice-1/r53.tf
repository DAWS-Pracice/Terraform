resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense
  zone_id = local.zone_id
  name    = each.key == "frontend" ? var.domai_name : "${each.key}.${var.domai_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip] #[aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}