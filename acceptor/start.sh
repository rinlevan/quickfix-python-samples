#!/bin/sh
rm -fr ./Sessions && mkdir -p ./Sessions && chmod 755 ./Sessions
sed -i "s/^SocketAcceptPort=.*/SocketAcceptPort=${APP_PORT}/" server.cfg
uv run python server.py server.cfg
