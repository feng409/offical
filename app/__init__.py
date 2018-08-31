from flask import Flask, request

app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')

@app.route('/')
def hello():
    return app.config['TOKEN']

