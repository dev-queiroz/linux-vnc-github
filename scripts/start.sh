#!/bin/bash

export USER=root

# Sincroniza com GitHub
./sync.sh

# Configura diretório /app para garantir cd
mkdir -p /app

# Configura senha VNC
mkdir -p /root/.vnc
echo "developer" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# Configura o arquivo xstartup do VNC para iniciar XFCE com dbus
cat > /root/.vnc/xstartup << 'EOF'
#!/bin/bash
xrdb $HOME/.Xresources
dbus-launch startxfce4 &
EOF

chmod +x /root/.vnc/xstartup

# Cria Xauthority se necessário
touch /root/.Xauthority

# Inicia o VNC Server
export DISPLAY=:1
vncserver :1 -geometry 1280x800 -depth 24

# Inicia o noVNC
websockify --web=/usr/share/novnc 6080 localhost:5901
