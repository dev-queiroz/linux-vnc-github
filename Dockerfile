FROM ubuntu:22.04

# Atualiza pacotes e instala XFCE, VNC e ferramentas básicas
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies tightvncserver git \
    && rm -rf /var/lib/apt/lists/*

# Configura o VNC
RUN mkdir -p /root/.vnc
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# Define a senha do VNC (substitua por uma senha segura)
RUN echo "Dv.23456" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# Expõe a porta do VNC
EXPOSE 5901

# Comando para iniciar o VNC
CMD ["sh", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && tail -f /dev/null"]
