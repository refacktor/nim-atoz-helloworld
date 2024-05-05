FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y git
ARG NIM_VERSION=2.0.4

#
# Install Nim
#
ADD https://nim-lang.org/download/nim-$NIM_VERSION-linux_x64.tar.xz /tmp/nim-$NIM_VERSION-linux_x64.tar.xz
RUN tar -xf /tmp/nim-$NIM_VERSION-linux_x64.tar.xz -C /root
ENV PATH=/root/nim-$NIM_VERSION/bin:$PATH

#
# Build the Application
#
WORKDIR /build
COPY nim_atoz_helloworld.nimble /build/
RUN nimble install -y "https://github.com/disruptek/atoz"
COPY src/ /build/src/
RUN nimble build
