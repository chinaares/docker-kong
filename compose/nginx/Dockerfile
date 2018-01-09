# a minimal Nginx container including ContainerPilot and a simple virtulhost config
FROM nginx:latest

RUN echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/debian/ stretch-proposed-updates main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/debian/ stretch-proposed-updates main non-free contrib" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl unzip

# we use consul-template to re-write our Nginx virtualhost config
COPY consul_template_0.14.0_linux_amd64.zip /tmp/consul_template_0.14.0_linux_amd64.zip
RUN unzip /tmp/consul_template_0.14.0_linux_amd64.zip && \
    mv consul-template /bin

# get ContainerPilot release
ENV CONTAINERPILOT_VERSION 2.7.2
COPY containerpilot.tar.gz /tmp/containerpilot.tar.gz
RUN export CP_SHA1=198d96c8d7bfafb1ab6df96653c29701510b833c \
    && echo "${CP_SHA1}  /tmp/containerpilot.tar.gz" | sha1sum -c \
    && tar zxf /tmp/containerpilot.tar.gz -C /bin \
    && rm /tmp/containerpilot.tar.gz

# add ContainerPilot configuration and onChange handler
COPY containerpilot.json /etc/containerpilot/containerpilot.json
COPY reload-nginx.sh /bin/reload-nginx.sh

# add Nginx virtualhost configuration
COPY nginx.conf /etc/nginx/nginx.conf

# add Nginx virtualhost template that we'll overwrite
COPY nginx.conf.ctmpl /etc/containerpilot/nginx.conf.ctmpl

EXPOSE 8000 8443 8001 8444