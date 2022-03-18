#resource "aws_iam_user" "stadmin" {
#  count = length(var.storage_user)
#  name  = element(var.storage_user,count.index)
#}
#
#resource "aws_iam_user" "compadmin" {
#  count = length(var.compute_user)
#  name  = element(var.compute_user,count.index)
#}
#resource "aws_iam_group" "sta-groups" {
#  count = length(var.storage_group)
#  name  = element(var.storage_group,count.index)
#}
#resource "aws_iam_group" "comp-groups" {
#  count = length(var.compute_group)
#  name  = element(var.compute_group,count.index)
#}
#resource "aws_iam_user_group_membership" "storage_admin1" {
#  user = element(aws_iam_user.stadmin.name)
#  groups = [
#    aws_iam_group.sta-groups.name
#  ]
#}
#resource "aws_iam_user_group_membership" "compu_admin1" {
#  user = element(aws_iam_user.compadmin.name)
#  groups = [
#    aws_iam_group.comp-groups.name
#  ]
#}
#
#
#output "user_arn" {
#  value = aws_iam_user.stadmin.*.arn
#}
#
#
#output "stagroup_arn" {
#  value = aws_iam_group.sta-groups.*.arn
#}
#
#output "compgroup_arn" {
#  value = aws_iam_group.comp-groups.*.arn
#}


resource "aws_iam_user_group_membership" "storage_admin1" {
  user = aws_iam_user.stadmin1.name
  groups = [
    aws_iam_group.storage-admin.name
  ]
}
resource "aws_iam_user_group_membership" "storage_admin2" {
  user = aws_iam_user.stadmin2.name
  groups = [
    aws_iam_group.storage-admin.name
  ]
}
resource "aws_iam_user_group_membership" "compute-admin1" {
  user = aws_iam_user.compadmin1.name
  groups = [
    aws_iam_group.compute-admin.name
  ]
}
resource "aws_iam_user_group_membership" "compute-admin2" {
  user = aws_iam_user.compadmin2.name
  groups = [
    aws_iam_group.compute-admin.name
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
