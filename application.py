from flask import Flask
import views
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-flask.html

application = Flask(__name__)
application.add_url_rule('/', 'index', views.index)

if __name__ == "__main__":
    application.debug = True
    application.run()