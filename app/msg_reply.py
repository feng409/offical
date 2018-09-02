from wechatpy.replies import TextReply, ImageReply
from wechatpy import parse_message
from wechatpy.replies import create_reply


msg_handle = dict()


def msg_handle_decorate(type):
    def wrapper(func):
        msg_handle[type] = func
        return func
    return wrapper


def msg_reply(data):
    msg = parse_message(data)
    print(msg_handle, end='\n\n')
    print(msg, end='\n\n')
    func = msg_handle[msg.type]
    return func(msg)


@msg_handle_decorate('text')
def text_reply(msg):
    reply = create_reply(msg.content, message=msg)
    return reply.render()
