terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "namespace" {
  type = string
}

module "context" {
  source      = "bendoerr-terraform-modules/context/null"
  version     = "0.4.1"
  namespace   = var.namespace
  environment = "example"
  role        = "tfuser"
  region      = "us-east-1"
  project     = "simple"
}

module "tfstate" {
  source  = "bendoerr-terraform-modules/tfstate/aws"
  version = "0.3.0"
  context = module.context.shared
}
