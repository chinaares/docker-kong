#!/bin/sh

export https_proxy=http://127.0.0.1:1080/pac?auth=s0kbJ38VJOD2PdPqQUiC\&t=201801080910381508

#CONTAINERPILOT_VERSION=3.6.2
CONTAINERPILOT_VERSION=2.7.2
echo Prepare Download https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz ......
curl -Lso /tmp/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz \
"https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz"
curl -Lso /tmp/containerpilot-${CONTAINERPILOT_VERSION}.sha1.txt \
"https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.sha1.txt"
cat /tmp/containerpilot-${CONTAINERPILOT_VERSION}.sha1.txt
cp -f /tmp/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz kong/containerpilot.tar.gz


CONTAINERPILOT_VERSION=2.4.1
echo Prepare Download https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz ......
curl -Lso /tmp/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz \
"https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz"
curl -Lso /tmp/containerpilot-${CONTAINERPILOT_VERSION}.sha1.txt \
"https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.sha1.txt"
cat /tmp/containerpilot-${CONTAINERPILOT_VERSION}.sha1.txt
cp -f /tmp/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz nginx/containerpilot.tar.gz

curl -Lo /tmp/consul_template_0.14.0_linux_amd64.zip https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip
cp -f /tmp/consul_template_0.14.0_linux_amd64.zip nginx/consul_template_0.14.0_linux_amd64.zip
