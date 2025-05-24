#!/bin/bash

mkdir -p /app
# shellcheck disable=SC2164
cd /app

if [ -d ".git" ]; then
  git pull origin main
else
  git clone https://github.com/dev-queiroz/linux-vnc-github.git /app
fi
