FROM alpine:latest

# Install xray and curl
RUN apk add --no-cache ca-certificates bash curl
RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install --version latest

WORKDIR /etc/xray
COPY config.json .

# Senior Dev move: Swap the hardcoded port 8080 with Railway's dynamic $PORT at runtime
CMD sed -i "s/8080/$PORT/g" config.json && xray run -c config.json
