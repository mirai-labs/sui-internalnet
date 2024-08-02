FROM caddy:2.8.4 AS caddy

FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /sui

ENV NETWORK="testnet" \
    VERSION="1.30.1"

COPY --from=caddy /usr/bin/caddy /usr/bin/caddy

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates \
    && curl -L https://github.com/MystenLabs/sui/releases/download/${NETWORK}-v${VERSION}/sui-${NETWORK}-v${VERSION}-ubuntu-x86_64.tgz | tar -xz \
    && mv sui /usr/local/bin \
    && rm -rf /var/lib/apt/lists/* /sui/*

COPY ./Caddyfile /etc/caddy/Caddyfile
COPY start.sh /sui/start.sh
RUN chmod +x /sui/start.sh

CMD ["/bin/bash", "/sui/start.sh"]