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
  count     = var.backend_user.create ? 0 : 1
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
    sid     = replace("${module.label_backend_dynamodb_rw[0].id}-0", "-", "")
    effect  = "Allow"
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
      sid     =  replace("${module.label_backend_dynamodb_rw[0].id}-1", "-", "")
      effect  = "Allow"
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
    sid     = replace("${module.label_backend_s3_rw[0].id}-0", "-", "")
    effect  = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = [var.backend_role.s3_policy.bucket_arn]
  }

  statement {
    sid     = replace("${module.label_backend_s3_rw[0].id}-1", "-", "")
    effect  = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]
    resources = ["${var.backend_role.s3_policy.bucket_arn}:*"]
  }

  dynamic "statement" {
    for_each = var.backend_role.s3_policy.kms_key != null ? ["this"] : []
    content {
      sid     = replace("${module.label_backend_s3_rw[0].id}-2", "-", "")
      effect  = "Allow"
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

data "aws_iam_policy_document" "assume_role" {
  count = var.backend_role.create ? 1 : 0

  statement {
    sid     = replace("${module.label_backend[0].id}-0", "-", "")
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [
        var.backend_user.create ? aws_iam_user.backend[0].arn : data.aws_iam_user.backend[0].arn
      ]
    }
  }

  dynamic "statement" {
    for_each = range(length(coalesce(var.backend_role.extra_principals, [])))
    content {
      sid     = replace("${module.label_backend[0].id}-${statement.key + 1}", "-", "")
      actions = ["sts:AssumeRole"]
      principals {
        type        = var.backend_role.extra_principals[statement.key].type
        identifiers = var.backend_role.extra_principals[statement.key].identifiers
      }
    }
  }
}

resource "aws_iam_role" "backend" {
  count              = var.backend_role.create ? 1 : 0
  name               = module.label_backend[0].id
  tags               = module.label_backend[0].tags
  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
}

resource "aws_iam_role_policy_attachment" "backend_dynamodb" {
  count      = var.backend_role.create ? 1 : 0
  role       = aws_iam_role.backend[0].id
  policy_arn = var.backend_role.dynamodb_policy.create ? aws_iam_policy.backend_dynamodb_rw[0].arn : var.backend_role.dynamodb_policy.policy_arn
}

resource "aws_iam_role_policy_attachment" "backend_s3" {
  count      = var.backend_role.create ? 1 : 0
  role       = aws_iam_role.backend[0].id
  policy_arn = var.backend_role.s3_policy.create ? aws_iam_policy.backend_s3_rw[0].arn : var.backend_role.s3_policy.policy_arn
}

