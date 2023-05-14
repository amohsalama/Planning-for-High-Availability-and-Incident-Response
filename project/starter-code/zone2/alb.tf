module "alb" {
  source = "./modules/alb"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnets = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}