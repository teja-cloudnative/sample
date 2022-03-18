variable "username" {
  type = list(string)
  default = ["stadmin1","stadmin2","compadmin1","compadmin2"]
}

variable "group" {
  type = list(string)
  default = ["storage-admin", "compute-admin"]
}
