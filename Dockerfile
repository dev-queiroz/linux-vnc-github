FROM ubuntu:22.04

# Configura modo não interativo para evitar prompts durante o build
ENV DEBIAN_FRONTEND=noninteractive

# Instala pacotes essenciais
RUN apt-get update && apt-get install -y \
    openssh-server \
    xrdp \
    xfce4 \
    xfce4-goodies \
    git \
    curl \
    vim \
    build-essential \
    net-tools \
    cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configura SSH
RUN mkdir /var/run/sshd \
    && echo 'PermitRootLogin no' >> /etc/ssh/sshd_config \
    && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Configura XRDP
RUN echo "xfce4-session" > /etc/skel/.xsession \
    && sed -i '/^port=/c\port=3389' /etc/xrdp/xrdp.ini

# Cria usuário developer
RUN useradd -m -s /bin/bash developer \
    && echo 'developer:developer' | chpasswd \
    && adduser developer sudo

# Expõe portas para SSH e RDP
EXPOSE 22 3389

# Copia script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Define ponto de entrada
ENTRYPOINT ["/entrypoint.sh"]
