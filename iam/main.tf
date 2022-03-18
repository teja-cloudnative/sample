resource "aws_iam_user" "stadmin" {
  count = length(var.storage_user)
  name  = element(var.storage_user,count.index)
}

resource "aws_iam_user" "compadmin" {
  count = length(var.compute_user)
  name  = element(var.compute_user,count.index)
}
resource "aws_iam_group" "iam-groups" {
  count = length(var.iam_groups)
  name  = element(var.iam_groups,count.index)
}
resource "aws_iam_user_group_membership" "storage_admin1" {
  user = aws_iam_user.stadmin.name
  groups = [
    aws_iam_group.iam-groups.name
  ]
}


output "user_arn" {
  value = aws_iam_user.stadmin.*.arn
}


output "group_arn" {
  value = aws_iam_group.iam-groups.*.arn
}

#resource "aws_iam_user_group_membership" "storage_admin1" {
#  user = aws_iam_user.stadmin1.name
#  groups = [
#    aws_iam_group.storage-admin.name
#  ]
#}
#resource "aws_iam_user_group_membership" "storage_admin2" {
#  user = aws_iam_user.stadmin2.name
#  groups = [
#    aws_iam_group.storage-admin.name
#  ]
#}
#resource "aws_iam_user_group_membership" "compute-admin1" {
#  user = aws_iam_user.compadmin1.name
#  groups = [
#    aws_iam_group.compute-admin.name
#  ]
#}
#resource "aws_iam_user_group_membership" "compute-admin2" {
#  user = aws_iam_user.compadmin2.name
#  groups = [
#    aws_iam_group.compute-admin.name
#  ]
#}
#resource "aws_iam_user" "stadmin1" {
#  name = "stadmin1"
#}
#
#resource "aws_iam_user" "stadmin2" {
#  name = "stadmin2"
#}
#
#resource "aws_iam_user" "compadmin1" {
#  name = "compadmin1"
#}
#
#resource "aws_iam_user" "compadmin2" {
#  name = "compadmin2"
#}
#
#resource "aws_iam_group" "storage-admin" {
#  name = "storage-admin"
#}
#
#resource "aws_iam_group" "compute-admin" {
#  name = "compute-admin"
#}
#
#resource "aws_iam_user_policy" "stadmin1" {
#  name = "test"
#  user = aws_iam_user.lb.name
#
#  # Terraform's "jsonencode" function converts a
#  # Terraform expression result to valid JSON syntax.
#  policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#      {
#        Action = [
#          "ec2:Describe*",
#        ]
#        Effect   = "Allow"
#        Resource = "*"
#      },
#    ]
#  })
#}