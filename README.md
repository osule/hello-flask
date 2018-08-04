# Flask from Terraform and Travis CI to Amazon Elastic Beanstalk

This is a sample application that deploys a flask application in Amazon Elastic Beanstalk Environment.

Here is an explanation of the file/folder structure.

    - terraform [contains configuration to setup the EBS application and environment]
    - .travis.yml [configuration for travis pipeline]
    - application.py [contains flask app exposing application callable object] 
    - requirements.txt [list of python dependencies required for our application]
    - views.py [contains views for the flask application. This can be refactored to a package]
    - templates [view templates for the flask application]
