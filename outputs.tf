output "backend_user_arn" {
  value = var.backend_user.create ? aws_iam_user.backend[0].arn : ""
}

output "backend_user_name" {
  value = var.backend_user.create ? aws_iam_user.backend[0].name : ""
}

output "backend_user_unique_id" {
  value = var.backend_user.create ? aws_iam_user.backend[0].unique_id : ""
}

output "backend_user_access_key_id" {
  value = var.backend_user.create ? aws_iam_access_key.backend[0].id : ""
}

output "backend_user_access_key_encrypted_secret" {
  value = var.backend_user.create ? aws_iam_access_key.backend[0].encrypted_secret : ""
}

output "backend_role_arn" {
  value = var.backend_role.create ? aws_iam_role.backend[0].arn : ""
}

output "backend_role_name" {
  value = var.backend_role.create ? aws_iam_role.backend[0].name : ""
}

output "backend_dynamodb_rw_policy_arn" {
  value = var.backend_role.dynamodb_policy.create ? aws_iam_policy.backend_s3_rw[0].arn : var.backend_role.s3_policy.policy_arn
}

output "backend_s3_rw_policy_arn" {
  value = var.backend_role.s3_policy.create ? aws_iam_policy.backend_s3_rw[0].arn : var.backend_role.s3_policy.policy_arn
}