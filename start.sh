#!/bin/bash

echo "Iniciando ambiente XFCE + VNC + ngrok..."

# Inicia dbus
dbus-launch &

# Inicia o servidor VNC
x11vnc -forever -shared -rfbport 5900 -display :0 &

# Baixa ngrok se não existir
if [ ! -f ./ngrok ]; then
  echo "Baixando ngrok..."
  wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
  unzip -qq ngrok-stable-linux-amd64.zip
  rm ngrok-stable-linux-amd64.zip
  chmod +x ngrok
fi

# Autentica ngrok
if [ -z "$NGROK_AUTHTOKEN" ]; then
  echo "Por favor, defina a variável NGROK_AUTHTOKEN com seu token antes de rodar."
  exit 1
fi

./ngrok authtoken $NGROK_AUTHTOKEN

# Expõe a porta VNC no ngrok
./ngrok tcp 5900 &

echo "Ambiente iniciado. Aguarde o link do ngrok aparecer."

# Espera o processo ngrok subir para mostrar o link
sleep 10

curl --silent http://127.0.0.1:4040/api/tunnels | jq -r '.tunnels[0].public_url'

# Mantém o script rodando para manter os serviços ativos
wait
