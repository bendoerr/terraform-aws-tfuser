module "tfuser" {
  source  = "../.."
  context = module.context.shared

  backend_user = {
    create : true,
    pgp_key : "keybase:bendoerr"
  }

  backend_role = {
    create = true
    dynamodb_policy = {
      create    = true
      table_arn = module.tfstate.lock_table_arn
    }
    s3_policy = {
      create     = true
      bucket_arn = module.tfstate.bucket_arn
    }
  }
}
