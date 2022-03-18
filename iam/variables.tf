variable "storage_user" {
  type = list(string)
  default = ["stadmin1","stadmin2","stadmin1"]
}
variable "compute_user" {
  type = list(string)
  default = ["compadmin1","compadmin1","compadmin1"]
}

variable "storage_group" {
  type = list(string)
  default = ["storage-admin"]
}

variable "compute_group" {
  type = list(string)
  default = ["compute-admin"]
}