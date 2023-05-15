variable "instance_count" {
  default = "3"
}

variable "project_root_directory" {}

variable "primary_availability_zones" {
  default = ["us-east-2a","us-east-2b", "us-east-2c"]
}

variable "secondary_availability_zones" {
  default = ["us-west-1a","us-west-1c"]
}