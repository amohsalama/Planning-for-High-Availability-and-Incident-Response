module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
}