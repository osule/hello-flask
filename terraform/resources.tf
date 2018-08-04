resource "aws_elastic_beanstalk_application" "hello-flask" {
  name        = "hello-flask"
  description = "A sample flask application deployed in AWS Elastic Beanstalk"

  appversion_lifecycle {
    service_role          = "${aws_iam_role.hello-flask-role.arn}"
    max_count             = 10
    delete_source_from_s3 = true
  }
}

resource "aws_s3_bucket" "hello-flask-bucket" {
  bucket = "${var.s3_bucket_name}"
  acl    = "private"

  tags {
    Name        = "hello flask bucket"
    Environment = "dev"
  }

  policy = "${data.aws_iam_policy_document.hello-flask-bucket-policy.json}"
}

resource "aws_elastic_beanstalk_environment" "hello-flask-env" {
  name                = "hello-flask-${var.env}"
  application         = "${aws_elastic_beanstalk_application.hello-flask.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.7.1 running Python 3.6"
  tier                = "WebServer"

  tags = {
    application = "hello-flask"
    env         = "${var.env}"
  }

  # https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html#command-options-general-autoscalingscheduledaction
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.nano"
  }
}
