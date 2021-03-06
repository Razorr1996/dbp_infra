locals {
  workspace = run_cmd("--terragrunt-quiet", "terraform", "workspace", "show")
  common    = read_terragrunt_config("common/terragrunt.hcl")
}

inputs = {
  region      = local.common.inputs.region
  project     = local.common.inputs.project
  application = local.common.inputs.application
  containers  = local.common.inputs.containers
  domain      = local.common.inputs.domain
  environment = local.workspace
}

remote_state = local.common.remote_state

terraform {
  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "init",
      "destroy",
      "plan",
      "push",
      "refresh"
    ]

    required_var_files = [
      "tfvars/${local.workspace}/terraform.tfvars"
    ]
  }

  after_hook "upload_vars" {
    commands     = ["apply"]
    execute      = ["make", "push_vars"]
    run_on_error = false
  }
}
