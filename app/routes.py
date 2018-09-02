from wechatpy.utils import check_signature
from wechatpy.exceptions import InvalidSignatureException
from app import app
from .msg_reply import msg_reply
from flask import request


@app.route('/', methods=['GET', 'POST'])
def message():
    if request.method == 'GET':
        token = app.config['TOKEN']
        nonce = request.args.get('nonce')
        signature = request.args.get('signature')
        timestamp = request.args.get('timestamp')
        echostr = request.args.get('echostr')
        try:
            check_signature(token, signature, timestamp, nonce)
            return echostr
        except InvalidSignatureException as e:
            print(e)
    else:
        return msg_reply(request.data)

