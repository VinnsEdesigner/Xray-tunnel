FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl unzip && \
    curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 7860

CMD ["xray", "run", "-c", "/etc/xray/config.json"]
