eks.tf 
    in module project_eks
                nodes_desired_size = 2
                nodes_max_size     = 3
                nodes_min_size     = 1

in _var.tf
       variable "instance_count" {
  default = "3"
}

Create alb.tf , modules/alb, and other changes in eks.tf
take screenshot of terraform apply and zone1.zip folder
