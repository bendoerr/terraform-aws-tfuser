<br/>
<p align="center">
  <a href="https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/raw/main/docs/logo-dark.png">
      <img src="https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/raw/main/docs/logo-light.png" alt="Logo">
    </picture>
  </a>

<h3 align="center">Ben's Terraform AWS Terraform Backend & Apply Users Module</h3>

  <p align="center">
    This is how I do it.
    <br/>
    <br/>
    <a href="https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser"><strong>Explore the docs »</strong></a>
    <br/>
    <br/>
    <a href="https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/issues">Report Bug</a>
    .
    <a href="https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/issues">Request Feature</a>
  </p>
</p>

[<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/bendoerr-terraform-modules/terraform-aws-tfuser?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/graphs/contributors)
[<img alt="GitHub issues" src="https://img.shields.io/github/issues/bendoerr-terraform-modules/terraform-aws-tfuser?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/issues)
[<img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/bendoerr-terraform-modules/terraform-aws-tfuser?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/pulls)
[<img alt="GitHub workflow: Terratest" src="https://img.shields.io/github/actions/workflow/status/bendoerr-terraform-modules/terraform-aws-tfuser/test.yml?logo=githubactions&label=terratest">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/actions/workflows/test.yml)
[<img alt="GitHub workflow: Linting" src="https://img.shields.io/github/actions/workflow/status/bendoerr-terraform-modules/terraform-aws-tfuser/lint.yml?logo=githubactions&label=linting">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/actions/workflows/lint.yml)
[<img alt="GitHub tag (with filter)" src="https://img.shields.io/github/v/tag/bendoerr-terraform-modules/terraform-aws-tfuser?filter=v*&label=latest%20tag&logo=terraform">](https://registry.terraform.io/modules/bendoerr-terraform-modules/label/null/latest)
[<img alt="OSSF-Scorecard Score" src="https://img.shields.io/ossf-scorecard/github.com/bendoerr-terraform-modules/terraform-aws-tfuser?logo=securityscorecard&label=ossf%20scorecard&link=https%3A%2F%2Fsecurityscorecards.dev%2Fviewer%2F%3Furi%3Dgithub.com%2Fbendoerr-terraform-modules%2Fterraform-aws-tfuser">](https://securityscorecards.dev/viewer/?uri=github.com/bendoerr-terraform-modules/terraform-aws-tfuser)
[<img alt="GitHub License" src="https://img.shields.io/github/license/bendoerr-terraform-modules/terraform-aws-tfuser?logo=opensourceinitiative">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/blob/main/LICENSE.txt)

## About The Project

Ben's Terraform AWS Terraform Backend & Apply Users Module

## Usage

TODO

```terraform
module "context" {
  source    = "bendoerr-terraform-modules/context/null"
  version   = "xxx"
  namespace = "btm"
  role      = "production"
  region    = "us-east-1"
  project   = "core"
}

module "tfuser" {
  source  = "bendoerr-terraform-modules/tfuser/aws"
  version = "xxx"
  context = module.context.shared
}
```

### Cost

There should be no cost associated with this module as it only creates IAM
resources which have no cost.

<!-- BEGIN_TF_DOCS -->

### Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 5.0  |

### Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.30.0  |

### Modules

| Name                                                                                                           | Source                                | Version |
| -------------------------------------------------------------------------------------------------------------- | ------------------------------------- | ------- |
| <a name="module_label_apply"></a> [label_apply](#module_label_apply)                                           | bendoerr-terraform-modules/label/null | 0.4.1   |
| <a name="module_label_backend"></a> [label_backend](#module_label_backend)                                     | bendoerr-terraform-modules/label/null | 0.4.1   |
| <a name="module_label_backend_dynamodb_rw"></a> [label_backend_dynamodb_rw](#module_label_backend_dynamodb_rw) | bendoerr-terraform-modules/label/null | 0.4.1   |
| <a name="module_label_backend_s3_rw"></a> [label_backend_s3_rw](#module_label_backend_s3_rw)                   | bendoerr-terraform-modules/label/null | 0.4.1   |

### Resources

| Name                                                                                                                                                      | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_access_key.apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key)                                    | resource    |
| [aws_iam_access_key.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key)                                  | resource    |
| [aws_iam_policy.apply_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                          | resource    |
| [aws_iam_policy.apply_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                          | resource    |
| [aws_iam_policy.backend_dynamodb_rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                              | resource    |
| [aws_iam_policy.backend_s3_rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                    | resource    |
| [aws_iam_role.apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                | resource    |
| [aws_iam_role.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                              | resource    |
| [aws_iam_role_policy_attachment.apply_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)          | resource    |
| [aws_iam_role_policy_attachment.apply_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)          | resource    |
| [aws_iam_role_policy_attachment.backend_dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource    |
| [aws_iam_role_policy_attachment.backend_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)       | resource    |
| [aws_iam_user.apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)                                                | resource    |
| [aws_iam_user.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)                                              | resource    |
| [aws_iam_policy_document.apply_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                     | data source |
| [aws_iam_policy_document.apply_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                     | data source |
| [aws_iam_policy_document.apply_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)           | data source |
| [aws_iam_policy_document.backend_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)         | data source |
| [aws_iam_policy_document.backend_dynamodb_rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)         | data source |
| [aws_iam_policy_document.backend_s3_rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)               | data source |
| [aws_iam_role.apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role)                                             | data source |
| [aws_iam_role.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role)                                           | data source |
| [aws_iam_user.apply](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user)                                             | data source |
| [aws_iam_user.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user)                                           | data source |

### Inputs

| Name                                                                  | Description                                      | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Default                               | Required |
| --------------------------------------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- | :------: |
| <a name="input_apply_role"></a> [apply_role](#input_apply_role)       | n/a                                              | <pre>object({<br> create = bool<br> arn = optional(string) # req, if create is false<br><br> extra_assume_statements = optional(list(object({<br> actions = list(string)<br> principals = object({<br> type = string<br> identifiers = list(string)<br> })<br> conditions = optional(list(object({<br> test = string<br> variable = string<br> values = list(string)<br> })))<br> })))<br><br> budgets = optional(bool, false)<br> dynamodb = optional(bool, false)<br> ec2_account = optional(bool, false)<br> ec2_networking = optional(bool, false)<br> ec2_tags = optional(bool, false)<br> ecs = optional(bool, false)<br> efs = optional(bool, false)<br> iam = optional(bool, false)<br> kms = optional(bool, false)<br> lambda = optional(bool, false)<br> logs = optional(bool, false)<br> route53 = optional(bool, false)<br> s3 = optional(bool, false)<br> sns = optional(bool, false)<br> ssm_params = optional(bool, false)<br> })</pre>                                                           | n/a                                   |   yes    |
| <a name="input_apply_user"></a> [apply_user](#input_apply_user)       | n/a                                              | <pre>object({<br> create = bool<br> name = optional(string) # req, if create is false or invalid<br> force_destroy = optional(bool) # opt<br> pgp_key = optional(string) # req if create is true or invalid<br> })</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | n/a                                   |   yes    |
| <a name="input_backend_role"></a> [backend_role](#input_backend_role) | n/a                                              | <pre>object({<br> create = bool<br> arn = optional(string) # opt, if create is false<br><br> extra_assume_statements = optional(list(object({<br> actions = list(string)<br> principals = object({<br> type = string<br> identifiers = list(string)<br> })<br> conditions = optional(list(object({<br> test = string<br> variable = string<br> values = list(string)<br> })))<br> })))<br><br> dynamodb_policy = optional(object({<br> create = bool<br> policy_arn = optional(string) # req, if create is false or invalid<br> table_arn = optional(string) # req, if create is true or invalid<br> kms_key = optional(string) # opt, if create is true or invalid<br> }), { create = false })<br><br> s3_policy = optional(object({<br> create = bool<br> policy_arn = optional(string) # req, if create is false or invalid<br> bucket_arn = optional(string) # req, if create is true or invalid<br> kms_key = optional(string) # opt, if create is true or invalid<br> }), { create = false })<br> })</pre> | <pre>{<br> "create": false<br>}</pre> |    no    |
| <a name="input_backend_user"></a> [backend_user](#input_backend_user) | n/a                                              | <pre>object({<br> create = bool<br> name = optional(string) # req, if create is false or invalid<br> force_destroy = optional(bool) # opt<br> pgp_key = optional(string) # req if create is true or invalid<br> })</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | <pre>{<br> "create": false<br>}</pre> |    no    |
| <a name="input_context"></a> [context](#input_context)                | Shared Context from Ben's terraform-null-context | <pre>object({<br> attributes = list(string)<br> dns_namespace = string<br> environment = string<br> instance = string<br> instance_short = string<br> namespace = string<br> region = string<br> region_short = string<br> role = string<br> role_short = string<br> project = string<br> tags = map(string)<br> })</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | n/a                                   |   yes    |

### Outputs

| Name                                                                                                                                                        | Description |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_apply_role_arn"></a> [apply_role_arn](#output_apply_role_arn)                                                                               | n/a         |
| <a name="output_apply_role_name"></a> [apply_role_name](#output_apply_role_name)                                                                            | n/a         |
| <a name="output_apply_user_access_key_encrypted_secret"></a> [apply_user_access_key_encrypted_secret](#output_apply_user_access_key_encrypted_secret)       | n/a         |
| <a name="output_apply_user_access_key_id"></a> [apply_user_access_key_id](#output_apply_user_access_key_id)                                                 | n/a         |
| <a name="output_apply_user_arn"></a> [apply_user_arn](#output_apply_user_arn)                                                                               | n/a         |
| <a name="output_apply_user_name"></a> [apply_user_name](#output_apply_user_name)                                                                            | n/a         |
| <a name="output_apply_user_unique_id"></a> [apply_user_unique_id](#output_apply_user_unique_id)                                                             | n/a         |
| <a name="output_backend_dynamodb_rw_policy_arn"></a> [backend_dynamodb_rw_policy_arn](#output_backend_dynamodb_rw_policy_arn)                               | n/a         |
| <a name="output_backend_role_arn"></a> [backend_role_arn](#output_backend_role_arn)                                                                         | n/a         |
| <a name="output_backend_role_name"></a> [backend_role_name](#output_backend_role_name)                                                                      | n/a         |
| <a name="output_backend_s3_rw_policy_arn"></a> [backend_s3_rw_policy_arn](#output_backend_s3_rw_policy_arn)                                                 | n/a         |
| <a name="output_backend_user_access_key_encrypted_secret"></a> [backend_user_access_key_encrypted_secret](#output_backend_user_access_key_encrypted_secret) | n/a         |
| <a name="output_backend_user_access_key_id"></a> [backend_user_access_key_id](#output_backend_user_access_key_id)                                           | n/a         |
| <a name="output_backend_user_arn"></a> [backend_user_arn](#output_backend_user_arn)                                                                         | n/a         |
| <a name="output_backend_user_name"></a> [backend_user_name](#output_backend_user_name)                                                                      | n/a         |
| <a name="output_backend_user_unique_id"></a> [backend_user_unique_id](#output_backend_user_unique_id)                                                       | n/a         |

<!-- END_TF_DOCS -->

## Roadmap

[<img alt="GitHub issues" src="https://img.shields.io/github/issues/bendoerr-terraform-modules/terraform-aws-tfuser?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/issues)

See the
[open issues](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/issues)
for a list of proposed features (and known issues).

## Contributing

[<img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/bendoerr-terraform-modules/terraform-aws-tfuser?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/pulls)

Contributions are what make the open source community such an amazing place to
be learn, inspire, and create. Any contributions you make are **greatly
appreciated**.

- If you have suggestions for adding or removing projects, feel free to
  [open an issue](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/issues/new)
  to discuss it, or directly create a pull request after you edit the
  _README.md_ file with necessary changes.
- Please make sure you check your spelling and grammar.
- Create individual PR for each suggestion.

### Creating A Pull Request

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[<img alt="GitHub License" src="https://img.shields.io/github/license/bendoerr-terraform-modules/terraform-aws-tfuser?logo=opensourceinitiative">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/blob/main/LICENSE.txt)

Distributed under the MIT License. See
[LICENSE](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/blob/main/LICENSE.txt)
for more information.

## Authors

[<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/bendoerr-terraform-modules/terraform-aws-tfuser?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-aws-tfuser/graphs/contributors)

- **Benjamin R. Doerr** - _Terraformer_ -
  [Benjamin R. Doerr](https://github.com/bendoerr/) - _Built Ben's Terraform
  Modules_

## Supported Versions

Only the latest tagged version is supported.

## Reporting a Vulnerability

See [SECURITY.md](SECURITY.md).

## Acknowledgements

- [ShaanCoding (ReadME Generator)](https://github.com/ShaanCoding/ReadME-Generator)
- [OpenSSF - Helping me follow best practices](https://openssf.org/)
- [StepSecurity - Helping me follow best practices](https://app.stepsecurity.io/)
- [Infracost - Better than AWS Calculator](https://www.infracost.io/)
