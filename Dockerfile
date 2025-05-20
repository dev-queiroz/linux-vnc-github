FROM dorowu/ubuntu-desktop-lxde-vnc

# Instala Git
RUN apt-get update && apt-get install -y git

# Cria um volume onde seu código vai ficar salvo
VOLUME /workspace

WORKDIR /workspace
