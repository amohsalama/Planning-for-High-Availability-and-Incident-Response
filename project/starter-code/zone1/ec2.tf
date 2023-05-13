  module "project_ec2" {
   source             = "./modules/ec2"
   instance_count     = var.instance_count
   name               = local.name
   account            = data.aws_caller_identity.current.account_id
   aws_ami            = "ami-06a5c2deb5aab26b1"
   private_subnet_ids = module.vpc.private_subnet_ids
   public_subnet_ids  = module.vpc.public_subnet_ids
   vpc_id             = module.vpc.vpc_id
   lb_security_group = module.alb.lb_security_group
   lb_target_group = module.alb.lb_target_group_arn
 }