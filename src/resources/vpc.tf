data "aws_vpcs" "main_vpc" {
  tags = {
    Name = var.vpc_name
    environment = var.env
    project = var.project
  }
}