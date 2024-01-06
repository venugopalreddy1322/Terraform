#creating multiple users
/*
resource "aws_iam_user" "iamuser" {
  count = 2
  name  = "${var.name_of_user}_${count.index+1}"
}
*/

#creating multiple users using LIST of variables
/*
resource "aws_iam_user" "iamuser" {
  count = length(var.name_of_user)
  name = var.name_of_user[count.index]
}*/

#creating using for_each/sets

resource "aws_iam_user" "iamuser" {
  for_each = toset(var.name_of_user)
  name = each.value
}

