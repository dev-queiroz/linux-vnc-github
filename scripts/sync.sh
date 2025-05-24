#!/bin/bash

mkdir -p /app
cd /app || exit 1

if [ -d ".git" ]; then
  git pull origin main
else
  git clone https://github.com/dev-queiroz/linux-vnc-github.git /app
fi

git add .
git commit -m "Auto-sync $(date +'%Y-%m-%d %H:%M:%S')" || true
git push origin main || true