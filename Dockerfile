FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
	make \
	wget \
	g++-9 \
	gcc-9 \
	gcc-aarch64-linux-gnu \
	binutils-aarch64-linux-gnu \
	&& rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100 --slave /usr/bin/g++ g++ /usr/bin/g++-9

RUN echo "root:root" | chpasswd

ARG LOCAL_USER_ID

RUN adduser -u ${LOCAL_USER_ID} --disabled-password --gecos '' rpi4 && \
  usermod -aG sudo rpi4 && \
  echo "rpi4 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER rpi4
ENV HOME /home/rpi4
ENV LANG en_US.UTF-8
WORKDIR /home/rpi4
