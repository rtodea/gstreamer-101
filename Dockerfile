FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# GStreamer Framework Deps
RUN apt-get update
RUN apt-get install -y pkg-config
RUN apt-get install -y libgstreamer1.0-dev
RUN apt-get install -y libgstreamer-plugins-base1.0-dev
RUN apt-get install -y libgstreamer-plugins-bad1.0-dev
RUN apt-get install -y gstreamer1.0-plugins-base
RUN apt-get install -y gstreamer1.0-plugins-good
RUN apt-get install -y gstreamer1.0-plugins-bad
RUN apt-get install -y gstreamer1.0-plugins-ugly
RUN apt-get install -y gstreamer1.0-libav
RUN apt-get install -y gstreamer1.0-doc
RUN apt-get install -y gstreamer1.0-tools
RUN apt-get install -y gstreamer1.0-x
RUN apt-get install -y gstreamer1.0-alsa
RUN apt-get install -y gstreamer1.0-gl
RUN apt-get install -y gstreamer1.0-gtk3
RUN apt-get install -y gstreamer1.0-qt5
RUN apt-get install -y gstreamer1.0-pulseaudio
RUN apt-get install -y libglib2.0-dev

# install cmake version 3.28.1
RUN apt-get install -y build-essential
RUN apt-get install -y libtool
RUN apt-get install -y autoconf
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y openssl
RUN apt-get install -y libssl-dev

COPY ./docker/scripts/install-cmake-3.28.1.sh /root/scripts/
RUN bash /root/scripts/install-cmake-3.28.1.sh
RUN ln -s /usr/local/bin/cmake /usr/bin/cmake
RUN apt-get install -y gdb

# GStreamer Project dependencies
RUN apt-get install -y libboost-all-dev

# SSH FS
RUN apt-get install -y sshfs
RUN apt-get install -y kmod

# Debugging Tools
RUN apt-get install -y netcat
RUN apt-get install -y telnet
RUN apt-get install -y htop

# NODE stack
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN . /root/.bashrc && nvm install v14.19.1
RUN . /root/.bashrc && nvm install v18
# PYTHON stack
RUN apt-get install -y python3-pip

# SSH stack
RUN apt-get install -y openssh-server
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config  # Change the port

# Clion
RUN apt-get install -y rsync

# Copy entrypoint.sh and other scripts
COPY ./docker/entrypoint.sh entrypoint.sh
COPY ./docker/scripts /root/scripts

RUN apt-get install -y alsa-utils
RUN apt-get install -y vlc-bin
RUN apt-get install -y mpg123
RUN apt-get install -y pulseaudio
