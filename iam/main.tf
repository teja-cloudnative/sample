resource "aws_iam_user" "demo" {
  count = length(var.username)
  name  = element(var.username,count.index)
}
resource "aws_iam_group" "demo-groups" {
  count = length(var.group)
  name  = element(var.group,count.index)
}

resource "aws_iam_user_group_membership" "storage-admin" {
  user = aws_iam_user.demo.name

  groups = [
    aws_iam_group.demo-groups.name
  ]
}

output "user_arn" {
  value = aws_iam_user.demo.*.arn
}


output "group_arn" {
  value = aws_iam_group.demo-groups.*.arn
}