data "aws_iam_policy_document" "crossaccount-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.execution_account}:role/LambdaExe-CliLogin-Notification"]
    }
  }
}
data "aws_iam_policy_document" "ssm-policies" {
  statement {
            actions = ["ssm:GetParameter",]
            resources = ["arn:aws:ssm:${local.current_region}:${local.current_account_id}:parameter/slack_webhook/*"]
        }
 statement {
            actions = ["ssm:DescribeParameters",]
            resources = ["arn:aws:ssm:eu-west-1:${local.current_account_id}:*",]
        }
 statement {
            actions = ["kms:Decrypt",]
            resources = ["arn:aws:kms:eu-west-1:${local.current_account_id}:key/alias/slack-webhook-url",]
        }     
}
