FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    novnc websockify \
    dbus-x11 x11-utils x11-xserver-utils xterm \
    midori \
    git curl net-tools \
    keyboard-configuration \
    && apt-get clean

# Configura VNC
RUN mkdir -p /root/.vnc
COPY scripts/start.sh /start.sh
COPY scripts/sync.sh /sync.sh
RUN chmod +x /start.sh /sync.sh

CMD ["/start.sh"]
