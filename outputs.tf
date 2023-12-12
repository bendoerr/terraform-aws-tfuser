output "backend_user_arn" {
  value = try(aws_iam_user.backend[0].arn, data.aws_iam_user.backend[0].arn, null)
}

output "backend_user_name" {
  value = try(aws_iam_user.backend[0].id, data.aws_iam_user.backend[0].user_name, null)
}

output "backend_user_unique_id" {
  value = try(aws_iam_user.backend[0].unique_id, data.aws_iam_user.backend[0].id, null)
}

output "backend_user_access_key_id" {
  value = var.backend_user.create ? aws_iam_access_key.backend[0].id : null
}

output "backend_user_access_key_encrypted_secret" {
  value = var.backend_user.create ? aws_iam_access_key.backend[0].encrypted_secret : null
}

output "backend_role_arn" {
  value = try(aws_iam_role.backend[0].arn, data.aws_iam_role.backend[0].arn, null)
}

output "backend_role_name" {
  value = try(aws_iam_role.backend[0].name, data.aws_iam_role.backend[0].name, null)
}

output "backend_dynamodb_rw_policy_arn" {
  value = try(aws_iam_policy.backend_dynamodb_rw[0].arn, var.backend_role.dynamodb_policy.policy_arn)
}

output "backend_s3_rw_policy_arn" {
  value = try(aws_iam_policy.backend_s3_rw[0].arn, var.backend_role.s3_policy.policy_arn)
}

output "apply_user_arn" {
  value = try(aws_iam_user.apply[0].arn, data.aws_iam_user.apply[0].arn, null)
}

output "apply_user_name" {
  value = try(aws_iam_user.apply[0].name, data.aws_iam_user.apply[0].user_name, null)
}

output "apply_user_unique_id" {
  value = try(aws_iam_user.apply[0].unique_id, data.aws_iam_user.apply[0].id, null)
}

output "apply_user_access_key_id" {
  value = var.apply_user.create ? aws_iam_access_key.apply[0].id : null
}

output "apply_user_access_key_encrypted_secret" {
  value = var.apply_user.create ? aws_iam_access_key.apply[0].encrypted_secret : null
}

output "apply_role_arn" {
  value = try(aws_iam_role.apply[0].arn, data.aws_iam_role.apply[0].arn, null)
}

output "apply_role_name" {
  value = try(aws_iam_role.apply[0].name, data.aws_iam_role.apply[0].name, null)
}
