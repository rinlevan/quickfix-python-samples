#!/bin/sh
rm -fr ./Sessions && mkdir -p ./Sessions && chmod 755 ./Sessions
sed -i "s/^SocketConnectHost=.*/SocketConnectHost=acceptor/" client.cfg
sed -i "s/^SocketConnectPort=.*/SocketConnectPort=${APP_PORT}/" client.cfg
uv run python client.py client.cfg
