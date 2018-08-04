resource "aws_elastic_beanstalk_application" "hello-flask" {
  name        = "hello-flask"
  description = "A sample flask application deployed in AWS Elastic Beanstalk"

  appversion_lifecycle {
    service_role          = "${aws_iam_role.hello-flask-role.arn}"
    max_count             = 10
    delete_source_from_s3 = true
  }
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
}
