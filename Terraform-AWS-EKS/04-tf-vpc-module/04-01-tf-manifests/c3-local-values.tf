locals {
  environment = var.environment
  owners = var.busines_division
  name = "${var.busines_division}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}