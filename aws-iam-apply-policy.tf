data "aws_iam_policy_document" "apply_1" {
  # budgets
  dynamic "statement" {
    for_each = var.apply_role.budgets ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "budgets:ModifyBudget",
        "budgets:ViewBudget",
      ]
      resources = ["*"]
    }
  }

  # dynamodb
  dynamic "statement" {
    for_each = var.apply_role.dynamodb ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "dynamodb:CreateTable",
        "dynamodb:DeleteTable",
        "dynamodb:DescribeContinuousBackups",
        "dynamodb:DescribeTable",
        "dynamodb:DescribeTimeToLive",
        "dynamodb:ListTagsOfResource",
        "dynamodb:TagResource",
        "dynamodb:UntagResource",
        "dynamodb:UpdateTable",
        "dynamodb:UpdateTimeToLive",
      ]
      resources = ["*"]
    }
  }

  # ec2_account
  dynamic "statement" {
    for_each = var.apply_role.ec2_account ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "ec2:DescribeAccountAttributes",
      ]
      resources = ["*"]
    }
  }

  # ec2_networking
  dynamic "statement" {
    for_each = var.apply_role.ec2_networking ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "ec2:AllocateAddress",
        "ec2:AssociateAddress",
        "ec2:AssociateDhcpOptions",
        "ec2:AssociateRouteTable",
        "ec2:AssociateVpcCidrBlock",
        "ec2:AttachInternetGateway",
        "ec2:AttachVpnGateway",
        "ec2:AuthorizeSecurityGroupEgress",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CreateCustomerGateway",
        "ec2:CreateDefaultVpc",
        "ec2:CreateDhcpOptions",
        "ec2:CreateEgressOnlyInternetGateway",
        "ec2:CreateFlowLogs",
        "ec2:CreateInternetGateway",
        "ec2:CreateNatGateway",
        "ec2:CreateNetworkAcl",
        "ec2:CreateNetworkAclEntry",
        "ec2:CreateRoute",
        "ec2:CreateRouteTable",
        "ec2:CreateSubnet",
        "ec2:CreateVPC",
        "ec2:CreateVpnGateway",
        "ec2:DeleteCustomerGateway",
        "ec2:DeleteDhcpOptions",
        "ec2:DeleteEgressOnlyInternetGateway",
        "ec2:DeleteFlowLogs",
        "ec2:DeleteInternetGateway",
        "ec2:DeleteNatGateway",
        "ec2:DeleteNetworkAcl",
        "ec2:DeleteNetworkAclEntry",
        "ec2:DeleteRoute",
        "ec2:DeleteRouteTable",
        "ec2:DeleteSubnet",
        "ec2:DeleteVPC",
        "ec2:DeleteVpnGateway",
        "ec2:DescribeAddresses",
        "ec2:DescribeCustomerGateways",
        "ec2:DescribeDhcpOptions",
        "ec2:DescribeEgressOnlyInternetGateways",
        "ec2:DescribeFlowLogs",
        "ec2:DescribeInternetGateways",
        "ec2:DescribeNatGateways",
        "ec2:DescribeNetworkAcls",
        "ec2:DescribeRouteTables",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSubnets",
        "ec2:DescribeVpcAttribute",
        "ec2:DescribeVpcs",
        "ec2:DescribeVpnGateways",
        "ec2:DetachInternetGateway",
        "ec2:DetachVpnGateway",
        "ec2:DisableVgwRoutePropagation",
        "ec2:DisassociateAddress",
        "ec2:DisassociateRouteTable",
        "ec2:DisassociateVpcCidrBlock",
        "ec2:EnableVgwRoutePropagation",
        "ec2:ReleaseAddress",
        "ec2:RevokeSecurityGroupEgress",
        "ec2:RevokeSecurityGroupIngress",
      ]
      resources = ["*"]
    }
  }

  # ec2_tags
  dynamic "statement" {
    for_each = var.apply_role.ec2_tags ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "ec2:CreateTags",
        "ec2:DeleteTags",
      ]
      resources = ["*"]
    }
  }

  # ecs
  dynamic "statement" {
    for_each = var.apply_role.ecs ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "ecs:CreateCluster",
        "ecs:CreateService",
        "ecs:DeleteCluster",
        "ecs:DeleteService",
        "ecs:DeregisterTaskDefinition",
        "ecs:DescribeClusters",
        "ecs:DescribeServices",
        "ecs:DescribeTaskDefinition",
        "ecs:RegisterTaskDefinition",
        "ecs:TagResource",
        "ecs:UntagResource",
        "ecs:UpdateCluster",
        "ecs:UpdateService"
      ]
      resources = ["*"]
    }
  }

  # efs
  dynamic "statement" {
    for_each = var.apply_role.efs ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "elasticfilesystem:CreateAccessPoint",
        "elasticfilesystem:CreateFileSystem",
        "elasticfilesystem:DeleteAccessPoint",
        "elasticfilesystem:DeleteFileSystem",
        "elasticfilesystem:DescribeAccessPoints",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeLifecycleConfiguration",
        "elasticfilesystem:DescribeMountTargets",
        "elasticfilesystem:TagResource",
        "elasticfilesystem:UntagResource"
      ]
      resources = ["*"]
    }
  }
}

data "aws_iam_policy_document" "apply_2" {
  # iam
  dynamic "statement" {
    for_each = var.apply_role.iam ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "iam:AddUserToGroup",
        "iam:AttachGroupPolicy",
        "iam:AttachRolePolicy",
        "iam:CreateAccessKey",
        "iam:CreateGroup",
        "iam:CreateOpenIDConnectProvider",
        "iam:CreatePolicy",
        "iam:CreateRole",
        "iam:CreateUser",
        "iam:DeleteAccessKey",
        "iam:DeleteGroup",
        "iam:DeleteOpenIDConnectProvider",
        "iam:DeletePolicy",
        "iam:DeleteRole",
        "iam:DeleteRolePermissionsBoundary",
        "iam:DeleteUser",
        "iam:DetachGroupPolicy",
        "iam:DetachRolePolicy",
        "iam:GetGroup",
        "iam:GetOpenIDConnectProvider",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetRole",
        "iam:GetUser",
        "iam:ListAccessKeys",
        "iam:ListAttachedGroupPolicies",
        "iam:ListAttachedRolePolicies",
        "iam:ListGroupsForUser",
        "iam:ListInstanceProfilesForRole",
        "iam:ListPolicyVersions",
        "iam:ListRolePolicies",
        "iam:PassRole",
        "iam:PutRolePermissionsBoundary",
        "iam:RemoveUserFromGroup",
        "iam:TagOpenIDConnectProvider",
        "iam:TagPolicy",
        "iam:TagRole",
        "iam:TagUser",
        "iam:UnTagUser",
        "iam:UntagOpenIDConnectProvider",
        "iam:UntagPolicy",
        "iam:UpdateAccessKey",
        "iam:UpdateOpenIDConnectProviderThumbprint",
      ]
      resources = ["*"]
    }
  }

  # kms
  dynamic "statement" {
    for_each = var.apply_role.kms ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "kms:CreateGrant",
        "kms:Decrypt",
        "kms:DescribeKey",
        "kms:Encrypt",
        "kms:GenerateDataKey*",
        "kms:ListAliases",
        "kms:ReEncrypt*",
      ]
      resources = ["*"]
    }
  }

  # lambda
  dynamic "statement" {
    for_each = var.apply_role.lambda ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "lambda:AddPermission",
        "lambda:CreateFunction",
        "lambda:DeleteFunction",
        "lambda:GetFunction",
        "lambda:GetFunctionCodeSigningConfig",
        "lambda:GetPolicy",
        "lambda:ListVersionsByFunction",
        "lambda:RemovePermission",
        "lambda:TagResource",
        "lambda:UntagResource"
      ]
      resources = ["*"]
    }
  }

  # logs
  dynamic "statement" {
    for_each = var.apply_role.logs ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "logs:AssociateKmsKey",
        "logs:CreateLogGroup",
        "logs:DeleteLogGroup",
        "logs:DeleteResourcePolicy",
        "logs:DeleteRetentionPolicy",
        "logs:DeleteSubscriptionFilter",
        "logs:DescribeLogGroups",
        "logs:DescribeResourcePolicies",
        "logs:DescribeSubscriptionFilters",
        "logs:DisassociateKmsKey",
        "logs:ListTagsLogGroup",
        "logs:PutResourcePolicy",
        "logs:PutRetentionPolicy",
        "logs:PutSubscriptionFilter",
        "logs:TagLogGroup",
        "logs:UntagLogGroup",
      ]
      resources = ["*"]
    }
  }

  # route53
  dynamic "statement" {
    for_each = var.apply_role.route53 ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "route53:ChangeResourceRecordSets",
        "route53:ChangeTagsForResource",
        "route53:CreateHostedZone",
        "route53:CreateQueryLoggingConfig",
        "route53:DeleteHostedZone",
        "route53:DeleteQueryLoggingConfig",
        "route53:GetChange",
        "route53:GetHostedZone",
        "route53:GetQueryLoggingConfig",
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource",
      ]
      resources = ["*"]
    }
  }

  # s3
  dynamic "statement" {
    for_each = var.apply_role.s3 ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:DeleteBucketWebsite",
        "s3:DeleteObjectTagging",
        "s3:DeleteObjectVersionTagging",
        "s3:GetAccelerateConfiguration",
        "s3:GetBucketAcl",
        "s3:GetBucketCORS",
        "s3:GetBucketLocation",
        "s3:GetBucketLogging",
        "s3:GetBucketObjectLockConfiguration",
        "s3:GetBucketOwnershipControls",
        "s3:GetBucketPolicy",
        "s3:GetBucketPublicAccessBlock",
        "s3:GetBucketRequestPayment",
        "s3:GetBucketTagging",
        "s3:GetBucketVersioning",
        "s3:GetBucketWebsite",
        "s3:GetEncryptionConfiguration",
        "s3:GetIntelligentTieringConfiguration",
        "s3:GetInventoryConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetMetricsConfiguration",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:GetObjectTagging",
        "s3:GetObjectVersionTagging",
        "s3:GetReplicationConfiguration",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:ListTagsForResource",
        "s3:PutAccelerateConfiguration",
        "s3:PutBucketAcl",
        "s3:PutBucketCORS",
        "s3:PutBucketLogging",
        "s3:PutBucketObjectLockConfiguration",
        "s3:PutBucketOwnershipControls",
        "s3:PutBucketPolicy",
        "s3:PutBucketPublicAccessBlock",
        "s3:PutBucketRequestPayment",
        "s3:PutBucketTagging",
        "s3:PutBucketVersioning",
        "s3:PutBucketWebsite",
        "s3:PutEncryptionConfiguration",
        "s3:PutIntelligentTieringConfiguration",
        "s3:PutInventoryConfiguration",
        "s3:PutLifecycleConfiguration",
        "s3:PutMetricsConfiguration",
        "s3:PutObject",
        "s3:PutObjectTagging",
        "s3:PutObjectVersionTagging",
        "s3:PutObjectLegalHold",
        "s3:PutObjectRetention",
        "s3:PutReplicationConfiguration",
        "s3:TagResource",
        "s3:UntagResource",
      ]
      resources = ["*"]
    }
  }

  # sns
  dynamic "statement" {
    for_each = var.apply_role.sns ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "sns:GetSubscriptionAttributes",
        "sns:CreateTopic",
        "sns:DeleteTopic",
        "sns:GetTopicAttributes",
        "sns:ListTagsForResource",
        "sns:SetTopicAttributes",
        "sns:TagResource",
        "sns:UnTagResource",
      ]
      resources = ["*"]
    }
  }

  # ssm_params
  dynamic "statement" {
    for_each = var.apply_role.ssm_params ? range(1) : []
    content {
      effect = "Allow"
      actions = [
        "ssm:AddTagsToResource",
        "ssm:DeleteParameter",
        "ssm:DescribeParameters",
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:ListTagsForResource",
        "ssm:PutParameter"
      ]
      resources = ["*"]
    }
  }
}
