module "tfuser" {
  source  = "../.."
  context = module.context.shared

  apply_user = {
    create  = true,
    pgp_key = "keybase:bendoerr"
  }

  apply_role = {
    create         = true
    budgets        = true
    dynamodb       = true
    ec2_account    = true
    ec2_networking = true
    ec2_tags       = true
    ecs            = true
    efs            = true
    iam            = true
    kms            = true
    lambda         = true
    logs           = true
    route53        = true
    s3             = true
    sns            = true
    ssm_params     = true
  }
}
