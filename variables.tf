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
    force_destroy = optional(bool) # opt
    pgp_key       = optional(string) # req if create is true or invalid
  })

  # TODO Validation

}

variable "backend_role" {
  type = object({
    create = bool
    arn    = optional(string) # req, if create is false

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
