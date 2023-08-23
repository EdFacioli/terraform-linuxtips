module "ec2" {
  source             = "./modules/ec2"
  vpc_id             = var.vpc_id
  instance_type      = var.instance_type
  file_path_key_pair = var.file_path_key_pair
}
