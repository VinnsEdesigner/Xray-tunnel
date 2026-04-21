FROM alpine:latest

# Install dependencies and Xray
RUN apk add --no-cache ca-certificates bash curl && \
    bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

WORKDIR /etc/xray
COPY config.json .

# The "Senior Dev" fix: 
# 1. Replace the hardcoded port in config.json with the environment variable $PORT
# 2. Start Xray
CMD sed -i "s/\"port\": [0-9]*/\"port\": ${PORT}/g" config.json && xray run -c config.json
