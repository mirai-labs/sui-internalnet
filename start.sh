#!/bin/bash

if [ ! -f /data/network.yaml ]; then
    sui genesis --force --working-dir /data --with-faucet
fi

caddy run --config /etc/caddy/Caddyfile &
sui start --network.config /data --with-faucet