provider "aws" {
  region = "us-east-1"
}

/*variable "uservalue" {
  default = {
    user1:"Denmark",
    user2:"Germany",
    user3:"Sweeden"
  }
}*/

#The following code is for single value in map
/*
resource "aws_iam_user" "iamuser" {
  for_each = var.uservalue
  name     = each.key
  tags = {
    country : each.value
  }
}
*/
# The following code is for multiple values in map
resource "aws_iam_user" "iamuser" {
  for_each = var.uservalue
  name = each.key
  tags = {
    country: each.value.country
    dept: each.value.department
  }
}
