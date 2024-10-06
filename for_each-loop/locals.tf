locals {
    domai_name = "pdevops.online"
    zone_id = "Z04609323L33TMWTNO2EZ"
    instance_type         = var.environment == "prod" ? "t3.small" : "t3.micro"
}