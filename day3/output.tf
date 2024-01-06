output "name1" {

  value = aws_iam_user.iamuser[0].name
}
output "name2" {
  value = aws_iam_user.iamuser[1].name
}
# output "name3" {
#   value = aws_iam_user.iamuser[2].name
# }