#!/bin/bash

mkdir -p /app
cd /app || exit 1

if [ -d ".git" ]; then
  git pull origin main
else
  git clone https://github.com/dev-queiroz/linux-vnc-github.git /app
fi
