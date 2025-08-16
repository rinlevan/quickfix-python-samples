#!/bin/sh
cd ${WORKING_DIR}
rm -fr ./Sessions && mkdir -p ./Sessions && chmod 755 ./Sessions
sed -i "s/^SocketAcceptPort=.*/SocketAcceptPort=${APP_PORT}/" server.cfg
python server.py server.cfg
