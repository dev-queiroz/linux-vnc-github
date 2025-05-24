FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    git \
    curl \
    net-tools \
    novnc websockify \
    && apt-get clean

# Configura VNC
RUN mkdir -p /root/.vnc
COPY scripts/start.sh /start.sh
COPY scripts/sync.sh /sync.sh
RUN chmod +x /start.sh /sync.sh

CMD ["/start.sh"]
