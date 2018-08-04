data "aws_caller_identity" "current" {}

resource "aws_iam_role" "hello-flask-role" {
  description = "IAM role for hello flask deployed in AWS Elastic beanstalk"
  name        = "hello-flask-role"

  # https://www.terraform.io/docs/providers/aws/r/iam_role.html

  assume_role_policy = "${data.aws_iam_policy_document.hello-flask-role-policy.json}"
}
