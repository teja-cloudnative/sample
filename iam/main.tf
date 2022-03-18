#resource "aws_iam_user" "demo" {
#  count = length(var.username)
#  name  = element(var.username,count.index)
#}
#resource "aws_iam_group" "demo-groups" {
#  count = length(var.group)
#  name  = element(var.group,count.index)
#}
#
#output "user_arn" {
#  value = aws_iam_user.demo.*.arn
#}
#
#
#output "group_arn" {
#  value = aws_iam_group.demo-groups.*.arn
#}

resource "aws_iam_user_group_membership" "storage-admin" {
  user = aws_iam_user.stadmin1
  groups = [
    aws_iam_group.storage-admin
  ]
}
resource "aws_iam_user_group_membership" "storage-admin" {
  user = aws_iam_user.stadmin2
  groups = [
    aws_iam_group.storage-admin
  ]
}
resource "aws_iam_user_group_membership" "compute-admin" {
  user = aws_iam_user.compadmin1
  groups = [
    aws_iam_group.compute-admin
  ]
}
resource "aws_iam_user_group_membership" "compute-admin" {
  user = aws_iam_user.compadmin2
  groups = [
    aws_iam_group.compute-admin
  ]
}
resource "aws_iam_user" "stadmin1" {
  name = "stadmin1"
}

resource "aws_iam_user" "stadmin2" {
  name = "stadmin2"
}

resource "aws_iam_user" "compadmin1" {
  name = "compadmin1"
}

resource "aws_iam_user" "compadmin2" {
  name = "compadmin2"
}

resource "aws_iam_group" "storage-admin" {
  name = "storage-admin"
}

resource "aws_iam_group" "compute-admin" {
  name = "compute-admin"
}

