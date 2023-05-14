# variable "name" {}
variable "vpc_id" {}
variable "private_subnet_ids" {}
variable "availability_zones" {}
variable "rds_instances_count" {
  default = 1
}
variable "rds_backup_retention_period" {
  default = 1
}