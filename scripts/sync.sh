#!/bin/bash

mkdir -p /app
# shellcheck disable=SC2164
cd /app

if [ -d ".git" ]; then
  git pull origin main
else
  git clone https://github.com/SEU_USUARIO/SEU_REPO.git /app
fi
