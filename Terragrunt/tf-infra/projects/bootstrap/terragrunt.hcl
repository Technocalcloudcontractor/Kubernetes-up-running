include {
  path = "${get_terragrunt_dir()}/../../config/bootstrap.hcl"
}

locals {
  config = yamldecode(file("${get_terragrunt_dir()}/../../config/staging-core-inputs.yaml"))
}

inputs = {
  vpc_name               = local.config.vpc_name
  project_id             = local.config.project_id
  target_service_account = local.config.target_service_account
  region                 = local.config.region
  env                    = local.config.environment
}


terraform {
    source = "${get_terragrunt_dir()}/../../modules//gcs"
}

