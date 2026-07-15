FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        dbus-x11 \
        fluxbox \
        git \
        iproute2 \
        less \
        nano \
        net-tools \
        nginx \
        novnc \
        procps \
        supervisor \
        ttyd \
        unzip \
        vim-tiny \
        websockify \
        wget \
        x11vnc \
        xterm \
        xvfb \
        zip \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ubuntu \
    && echo 'ubuntu:ubuntu' | chpasswd \
    && mkdir -p /workspace /var/log/supervisor /run/nginx \
    && chown -R ubuntu:ubuntu /workspace

COPY web /opt/ubuntu-web
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/ubuntu.conf
COPY start.sh /usr/local/bin/start-ubuntu

RUN chmod +x /usr/local/bin/start-ubuntu

ENV DISPLAY=:0
ENV HOME=/home/ubuntu
ENV USER=ubuntu
ENV SHELL=/bin/bash

EXPOSE 8080

CMD ["/usr/local/bin/start-ubuntu"]
