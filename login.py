# 连接主机
def sendDirConnData(T_DIR_FAST_GETIN,sessionKey):
    ReqList=[T_DIR_FAST_GETIN,sessionKey]
    # receiver.sendData(this.dirConn.getID(),_loc3_[0],_loc3_[1]);
    # receiver = new LoginReceiver(system);
# 快速登录接口
def fastLoginReq(sessionKey):
    sendDirConnData(458757,sessionKey)