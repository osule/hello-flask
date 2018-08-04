output "hello-flask-fqcn" {
  value = "${aws_elastic_beanstalk_environment.hello-flask-env.cname}"
}
