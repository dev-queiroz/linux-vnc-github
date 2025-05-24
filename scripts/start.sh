#!/bin/bash

export USER=root

# Sincroniza com GitHub
./sync.sh

# Configura o arquivo xstartup do VNC para iniciar XFCE
mkdir -p /root/.vnc
echo '#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &' > /root/.vnc/xstartup
chmod +x /root/.vnc/xstartup

# Inicia o VNC Server
export DISPLAY=:1
vncserver :1 -geometry 1280x800 -depth 24

# Inicia o noVNC
websockify --web=/usr/share/novnc 6080 localhost:5901
