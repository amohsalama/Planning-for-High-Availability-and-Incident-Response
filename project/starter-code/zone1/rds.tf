module "project_rds_p" {
  source = "./modules/rds-p"
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.vpc_id
  availability_zones = var.primary_availability_zones
  rds_instances_count = 2
  rds_backup_retention_period = 5
}

module "project_rds_s" {
  source                  = "./modules/rds-s"
  primary_db_cluster_arn  = module.project_rds_p.db_cluster_arn
  providers = {
    aws = aws.usw1
  }
  private_subnet_ids = module.vpc_west.private_subnet_ids
  vpc_id = module.vpc_west.vpc_id
  availability_zones = var.secondary_availability_zones
  rds_backup_retention_period = 5
  rds_instances_count = 2
}