import random
import string
import time
import logging

from flask import request, render_template, send_from_directory, jsonify, make_response
from wechatpy.exceptions import InvalidSignatureException
from wechatpy import WeChatClient
from wechatpy.utils import check_signature
from werkzeug.utils import secure_filename

from app import app
from . import util
from .msg_reply import msg_reply

wechat_client = WeChatClient(app.config['APP_ID'], app.config['APP_SECRET'])
_logging = logging.getLogger(__name__)


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


@app.route('/signature', methods=['GET'])
def signature():
    data = dict(
        ticket=wechat_client.jsapi.get_jsapi_ticket(),
        noncestr=''.join(random.sample(string.ascii_letters, 16)),
        timestamp=int(time.time()),
        url='http://offical.eoyohe.cn/forward'
    )
    data['signature'] = wechat_client.jsapi.get_jsapi_signature(**data)
    return jsonify(data)


@app.route('/image', methods=['POST', 'OPTIONS'])
def image():
    if request.method == 'POST':
        file = request.files['file']
        print(file.filename)
        if file and util.allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(app.config['UPLOAD_FOLDER'] + filename)
            return jsonify(code=200, msg='success', data=filename)
        else:
            return jsonify(code=400, msg='failure')
    else:
        response = make_response('')
        response.headers['Access-Control-Allow-Origin'] = '*'
        return response


@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'],
                               filename)


@app.route('/forward')
def forward():
    return render_template('index.html')
