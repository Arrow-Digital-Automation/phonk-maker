module "environment" {
  source = "../modules/opencode_environment"

  environment     = var.environment
  revision        = var.revision
  release_id      = var.release_id
  aws_account_id  = var.aws_account_id
  site_index_path = "${path.root}/../../index.html"
  price_class     = var.price_class
}
