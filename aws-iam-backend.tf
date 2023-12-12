module "label_backend" {
  count   = var.backend_user.create ? 1 : 0
  source  = "bendoerr-terraform-modules/label/null"
  version = "0.4.1"
  context = var.context
  name    = "backend"
}

resource "aws_iam_user" "backend" {
  count         = var.backend_user.create ? 1 : 0
  name          = module.label_backend[0].id
  tags          = module.label_backend[0].tags
  force_destroy = try(var.backend_user.force_destroy, null)
}

resource "aws_iam_access_key" "backend" {
  count   = var.backend_user.create ? 1 : 0
  user    = aws_iam_user.backend[0].name
  pgp_key = var.backend_user.pgp_key
}

data "aws_iam_user" "backend" {
  count     = var.backend_user.create ? 0 : (var.backend_user.name != null ? 1 : 0)
  user_name = var.backend_user.name
}

module "label_backend_dynamodb_rw" {
  count   = var.backend_role.dynamodb_policy.create ? 1 : 0
  source  = "bendoerr-terraform-modules/label/null"
  version = "0.4.1"
  context = var.context
  name    = "backend-dynamodb-rw"
}

data "aws_iam_policy_document" "backend_dynamodb_rw" {
  count = var.backend_role.dynamodb_policy.create ? 1 : 0

  statement {
    sid    = replace("${module.label_backend_dynamodb_rw[0].id}-0", "-", "")
    effect = "Allow"
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
    ]
    resources = [var.backend_role.dynamodb_policy.table_arn]
  }

  dynamic "statement" {
    for_each = var.backend_role.dynamodb_policy.kms_key != null ? ["this"] : []
    content {
      sid    = replace("${module.label_backend_dynamodb_rw[0].id}-1", "-", "")
      effect = "Allow"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
      ]
      resources = [var.backend_role.dynamodb_policy.kms_key]
    }
  }
}

resource "aws_iam_policy" "backend_dynamodb_rw" {
  count  = var.backend_role.dynamodb_policy.create ? 1 : 0
  name   = module.label_backend_dynamodb_rw[0].id
  tags   = module.label_backend_dynamodb_rw[0].tags
  policy = data.aws_iam_policy_document.backend_dynamodb_rw[0].json
}

module "label_backend_s3_rw" {
  count   = var.backend_role.s3_policy.create ? 1 : 0
  source  = "bendoerr-terraform-modules/label/null"
  version = "0.4.1"
  context = var.context
  name    = "backend-s3-rw"
}

data "aws_iam_policy_document" "backend_s3_rw" {
  count = var.backend_role.s3_policy.create ? 1 : 0

  statement {
    sid    = replace("${module.label_backend_s3_rw[0].id}-0", "-", "")
    effect = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = [var.backend_role.s3_policy.bucket_arn]
  }

  statement {
    sid    = replace("${module.label_backend_s3_rw[0].id}-1", "-", "")
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]
    # tfsec:ignore:aws-iam-no-policy-wildcards
    resources = ["${var.backend_role.s3_policy.bucket_arn}/*"]
  }

  dynamic "statement" {
    for_each = var.backend_role.s3_policy.kms_key != null ? ["this"] : []
    content {
      sid    = replace("${module.label_backend_s3_rw[0].id}-2", "-", "")
      effect = "Allow"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
      ]
      resources = [var.backend_role.s3_policy.kms_key]
    }
  }
}

resource "aws_iam_policy" "backend_s3_rw" {
  count  = var.backend_role.s3_policy.create ? 1 : 0
  name   = module.label_backend_s3_rw[0].id
  tags   = module.label_backend_s3_rw[0].tags
  policy = data.aws_iam_policy_document.backend_s3_rw[0].json
}

data "aws_iam_policy_document" "backend_assume_role" {
  count = var.backend_role.create ? 1 : 0

  statement {
    sid     = replace("${module.label_backend[0].id}-0", "-", "")
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = [
        var.backend_user.create ? aws_iam_user.backend[0].arn : data.aws_iam_user.backend[0].arn
      ]
    }
  }

  dynamic "statement" {
    for_each = range(length(coalesce(var.backend_role.extra_assume_statements, [])))
    content {
      sid     = replace("${module.label_backend[0].id}-${statement.key + 1}", "-", "")
      actions = var.backend_role.extra_assume_statements[statement.key].actions
      principals {
        type        = var.backend_role.extra_assume_statements[statement.key].principals.type
        identifiers = var.backend_role.extra_assume_statements[statement.key].principals.identifiers
      }
      dynamic "condition" {
        for_each = range(length(coalesce(var.backend_role.extra_assume_statements[statement.key].conditions, [])))
        content {
          test     = var.backend_role.extra_assume_statements[statement.key].conditions[condition.key].test
          variable = var.backend_role.extra_assume_statements[statement.key].conditions[condition.key].variable
          values   = var.backend_role.extra_assume_statements[statement.key].conditions[condition.key].values
        }
      }
    }
  }
}

resource "aws_iam_role" "backend" {
  count              = var.backend_role.create ? 1 : 0
  name               = module.label_backend[0].id
  tags               = module.label_backend[0].tags
  assume_role_policy = data.aws_iam_policy_document.backend_assume_role[0].json
}

locals {
  attach_dyndb = var.backend_role.create && (var.backend_role.dynamodb_policy.create || var.backend_role.dynamodb_policy.policy_arn != null)
  attach_s3    = var.backend_role.create && (var.backend_role.s3_policy.create || var.backend_role.s3_policy.policy_arn != null)
}

data "aws_iam_role" "backend" {
  count = var.backend_role.create ? 0 : (local.attach_dyndb || local.attach_s3 ? 1 : 0)
  name  = var.backend_role.arn
}

resource "aws_iam_role_policy_attachment" "backend_dynamodb" {
  count      = local.attach_dyndb ? 1 : 0
  role       = var.backend_role.create ? aws_iam_role.backend[0].id : data.aws_iam_role.backend[0].id
  policy_arn = var.backend_role.dynamodb_policy.create ? aws_iam_policy.backend_dynamodb_rw[0].arn : var.backend_role.dynamodb_policy.policy_arn
}

resource "aws_iam_role_policy_attachment" "backend_s3" {
  count      = local.attach_s3 ? 1 : 0
  role       = var.backend_role.create ? aws_iam_role.backend[0].id : data.aws_iam_role.backend[0].id
  policy_arn = var.backend_role.s3_policy.create ? aws_iam_policy.backend_s3_rw[0].arn : var.backend_role.s3_policy.policy_arn
}
