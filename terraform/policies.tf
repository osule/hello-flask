data "aws_iam_policy_document" "hello-flask-bucket-policy" {
  statement {
    actions = ["s3:*"]

    # https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html
    principals {
      type        = "AWS"
      identifiers = ["${data.aws_caller_identity.current.arn}"]
    }

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }
}

data "aws_iam_policy_document" "hello-flask-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
