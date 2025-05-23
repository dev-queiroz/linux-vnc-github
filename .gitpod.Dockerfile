FROM consol/ubuntu-xfce-vnc:latest

USER root

RUN apt-get update && apt-get install -y dbus-x11 wget unzip && rm -rf /var/lib/apt/lists/*

USER gitpod
