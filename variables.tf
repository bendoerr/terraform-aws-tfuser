variable "context" {
  type = object({
    attributes     = list(string)
    dns_namespace  = string
    environment    = string
    instance       = string
    instance_short = string
    namespace      = string
    region         = string
    region_short   = string
    role           = string
    role_short     = string
    project        = string
    tags           = map(string)
  })
  description = "Shared Context from Ben's terraform-null-context"
}

variable "backend_user" {
  type = object({
    create        = bool
    name          = optional(string) # req, if create is false or invalid
    force_destroy = optional(bool)   # opt
    pgp_key       = optional(string) # req if create is true or invalid
  })

  # TODO Validation

}

variable "backend_role" {
  type = object({
    create = bool
    arn    = optional(string) # opt, if create is false

    extra_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))

    dynamodb_policy = object({
      create     = bool
      policy_arn = optional(string) # req, if create is false or invalid
      table_arn  = optional(string) # req, if create is true or invalid
      kms_key    = optional(string) # opt, if create is true or invalid
    })

    s3_policy = object({
      create     = bool
      policy_arn = optional(string) # req, if create is false or invalid
      bucket_arn = optional(string) # req, if create is true or invalid
      kms_key    = optional(string) # opt, if create is true or invalid
    })

  })

  # TODO Validation
}

variable "apply_user" {
  type = object({
    create        = bool
    name          = optional(string) # req, if create is false or invalid
    force_destroy = optional(bool)   # opt
    pgp_key       = optional(string) # req if create is true or invalid
  })
}

variable "apply_role" {
  type = object({
    create = bool
    arn    = optional(string) # req, if create is false

    extra_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))

    budgets        = optional(bool, false)
    dynamodb       = optional(bool, false)
    ec2_account    = optional(bool, false)
    ec2_networking = optional(bool, false)
    ec2_tags       = optional(bool, false)
    ecs            = optional(bool, false)
    efs            = optional(bool, false)
    iam            = optional(bool, false)
    kms            = optional(bool, false)
    lambda         = optional(bool, false)
    logs           = optional(bool, false)
    route53        = optional(bool, false)
    s3             = optional(bool, false)
    sns            = optional(bool, false)
    ssm_params     = optional(bool, false)
  })
}
