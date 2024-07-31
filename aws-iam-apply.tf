module "label_apply" {
  source  = "bendoerr-terraform-modules/label/null"
  version = "0.4.2"
  context = var.context
  name    = "apply"
}

resource "aws_iam_user" "apply" {
  count         = var.apply_user.create ? 1 : 0
  name          = module.label_apply.id
  tags          = module.label_apply.tags
  force_destroy = try(var.apply_user.force_destroy, null)
}

resource "aws_iam_access_key" "apply" {
  count   = var.apply_user.create ? 1 : 0
  user    = aws_iam_user.apply[0].name
  pgp_key = var.apply_user.pgp_key
}

data "aws_iam_user" "apply" {
  count     = var.apply_user.create ? 0 : 1
  user_name = var.apply_user.name
}

data "aws_iam_policy_document" "apply_assume_role" {
  count = var.apply_role.create ? 1 : 0

  statement {
    sid     = replace("${module.label_apply.id}-0", "-", "")
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = [
        var.apply_user.create ? aws_iam_user.apply[0].arn : data.aws_iam_user.apply[0].arn
      ]
    }
  }

  dynamic "statement" {
    for_each = range(length(coalesce(var.apply_role.extra_assume_statements, [])))
    content {
      sid     = replace("${module.label_apply.id}-${statement.key + 1}", "-", "")
      actions = var.apply_role.extra_assume_statements[statement.key].actions
      principals {
        type        = var.apply_role.extra_assume_statements[statement.key].principals.type
        identifiers = var.apply_role.extra_assume_statements[statement.key].principals.identifiers
      }
      dynamic "condition" {
        for_each = range(length(coalesce(var.apply_role.extra_assume_statements[statement.key].conditions, [])))
        content {
          test     = var.apply_role.extra_assume_statements[statement.key].conditions[condition.key].test
          variable = var.apply_role.extra_assume_statements[statement.key].conditions[condition.key].variable
          values   = var.apply_role.extra_assume_statements[statement.key].conditions[condition.key].values
        }
      }
    }
  }
}

resource "aws_iam_role" "apply" {
  count              = var.apply_role.create ? 1 : 0
  name               = module.label_apply.id
  tags               = module.label_apply.tags
  assume_role_policy = data.aws_iam_policy_document.apply_assume_role[0].json
}

data "aws_iam_role" "apply" {
  count = var.apply_role.create ? 0 : 1
  name  = var.apply_role.arn
}

resource "aws_iam_policy" "apply_1" {
  name   = "${module.label_apply.id}-1"
  tags   = module.label_apply.tags
  policy = data.aws_iam_policy_document.apply_1.json
}

resource "aws_iam_role_policy_attachment" "apply_1" {
  role       = var.apply_role.create ? aws_iam_role.apply[0].id : data.aws_iam_role.apply[0].id
  policy_arn = aws_iam_policy.apply_1.arn
}

resource "aws_iam_policy" "apply_2" {
  name   = "${module.label_apply.id}-2"
  tags   = module.label_apply.tags
  policy = data.aws_iam_policy_document.apply_2.json
}

resource "aws_iam_role_policy_attachment" "apply_2" {
  role       = var.apply_role.create ? aws_iam_role.apply[0].id : data.aws_iam_role.apply[0].id
  policy_arn = aws_iam_policy.apply_2.arn
}
