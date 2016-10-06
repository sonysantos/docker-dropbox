FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common ; \
  add-apt-repository "deb http://extra.linuxmint.com rosa main" ; \
  apt-key adv --recv-key --keyserver keyserver.ubuntu.com 3EE67F3D0FF405B2 ; \
  apt-get update && apt-get install -y dropbox \
  && rm -rf /var/lib/apt/lists/*


