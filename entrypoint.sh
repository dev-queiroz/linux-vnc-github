#!/bin/bash

# Inicia serviço SSH
service ssh start

# Inicia serviço XRDP
service xrdp start

# Inicia serviço cron
service cron start

# Mantém o container rodando
exec "$@"
