from wechatpy import parse_message
from wechatpy.replies import create_reply


msg_handle = dict()


def msg_handle_decorate(type):
    def wrapper(func):
        msg_handle[type] = func
        return func
    return wrapper


def msg_reply(data):
    print('data -> ', data, end='\n\n')
    msg = parse_message(data)
    print('msg -> ', msg, end='\n\n')
    func = msg_handle[msg.type]
    return func(msg)


@msg_handle_decorate('text')
def text_reply(msg):
    reply = create_reply(msg.content, message=msg)
    return reply.render()


@msg_handle_decorate('image')
def image_reply(msg):
    reply = create_reply('hello', message=msg)
    return reply.render()

