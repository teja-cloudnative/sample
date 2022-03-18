resource "aws_iam_user" "demo" {
  count = length(var.username)
  name  = element(var.username,count.index)
}

output "user_arn" {
  value = aws_iam_user.demo.*.arn
}

resource "aws_iam_group" "demo-groups" {
  count = length(var.group)
  name  = element(var.group,count.index)
}

output "group_arn" {
  value = aws_iam_group.demo-groups.*.arn
}