variable "name" {
  description = "ALB name"
  default = "flask"
}


variable "public_subnets" {
  description = "List of public subnets ids"
}

variable "vpc_id" {
  description = "ID of vpc where security group will be created"
}