[![Build Status](https://travis-ci.org/osule/hello-flask.svg?branch=master)](https://travis-ci.org/osule/hello-flask)

# Flask from Terraform and Travis CI to Amazon Elastic Beanstalk

This is a sample application that deploys a flask application in Amazon Elastic Beanstalk Environment.

Here is an explanation of the file/folder structure.

    terraform [contains configuration to setup the EBS application and environment]

    .travis.yml [configuration for travis pipeline]

    application.py [contains flask app exposing application callable object] 

    requirements.txt [list of python dependencies required for our application]

    views.py [contains views for the flask application. This can be refactored to a package]

    templates [view templates for the flask application]


# Deployment


## Setting up the infrastructure

- Install Terraform by following the instructions in [this URL](https://www.terraform.io/intro/getting-started/install.html) 

- Fork this repository to your account then clone the forked repository by running:

        git clone https://github.com/<your-github-username>/hello-flask

- In `~/.aws/credentials`, define the following profile: 

        [hello-flask]
        aws_access_key_id = <access-key-id>
        aws_secret_access_key = <secret-access-key>

  This must be a profile with the following IAM policies:

        IAMFullAccess
        AmazonS3FullAccess
        AWSElasticBeanstalkFullAccess

**Note that** you can favor more fined-tuned permissions by creating custom
policy. I'm still determining a mix of permissions to get a running setup.  

- In your terminal, run

        terraform plan

- Eyeball the changes that will be applied then apply it by running:

        terraform apply

- Copy the full qualified canonical domain output (fqcn) in the terminal.

**Note that** applying only creates the environment and application. 
While you can use any CI service, there is currently only configuration for Travis CI.

## Deploying the application source code with Travis CI

- Install travis cli tool

- Encrypt your aws-secret-access-key and aws-access-key and set their encrypted 
  values in `.travis.yml`

- Visit [Travis CI](https://travis-ci.org/) and login with your Github account.

- Click the "**+**" tab under the Search bar and add the forked repository.

- Now push the updated `.travis.yml` to the forked repository in Github.
    Travis will build and deploy the application.

### Celebrate 🎉

- Browse to the copied full qualified canonical domain you copied earlier.
    You should see the heading text "Hallo" together with the flask logo.

- Modify the source code as you which.
