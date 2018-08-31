from wechatpy.utils import check_signature
from flask import Flask, request
from wechatpy.exceptions import InvalidSignatureException

app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')

@app.route('/')
def message():
    token = app.config['TOKEN']
    nonce = request.args.get('nonce')
    signature = request.args.get('signature')
    timestamp = request.args.get('timestamp')
    echostr = request.args.get('echostr')
    try:
        check_signature(token, signature, timestamp, nonceo)
        return echostr
    except InvalidSignatureException as e:
        print(e)

