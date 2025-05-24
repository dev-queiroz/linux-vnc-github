#!/bin/bash

# Sincroniza com GitHub
./sync.sh

# Configura VNC
export DISPLAY=:1
vncserver :1 -geometry 1280x800 -depth 24

# Inicia noVNC
websockify --web=/usr/share/novnc/ --wrap-mode=ignore 6080 localhost:5901
