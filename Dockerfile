FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    git \
    curl \
    net-tools \
    novnc websockify \
    keyboard-configuration \
    && apt-get clean

# Configura VNC
RUN mkdir -p /root/.vnc \
echo "developer" | vncpasswd -f > /root/.vnc/passwd \
chmod 600 /root/.vnc/passwd
COPY scripts/start.sh /start.sh
COPY scripts/sync.sh /sync.sh
RUN chmod +x /start.sh /sync.sh

CMD ["/start.sh"]
