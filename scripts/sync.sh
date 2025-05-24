#!/bin/bash

# shellcheck disable=SC2164
cd /app || mkdir /app && cd /app

if [ -d ".git" ]; then
  git pull origin main
else
  git clone https://github.com/dev-queiroz/linux-vnc-github.git /app
fi
