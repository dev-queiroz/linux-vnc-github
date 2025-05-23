FROM gitpod/workspace-full

USER root

RUN apt-get update && \
    apt-get install -y git xfce4 xfce4-goodies x11vnc dbus-x11 wget unzip && \
    rm -rf /var/lib/apt/lists/*

USER gitpod
