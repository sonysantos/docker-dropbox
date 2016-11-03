FROM ubuntu:16.04

MAINTAINER Sony Santos - sony.fermino(at)gmail

# root phase
# install things
RUN apt-get update && apt-get install -y wget python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python

# dbox: dropbox user
RUN useradd -ms /bin/bash dbox

# as root, generate locale (for UTF-8 folders)
RUN locale-gen "en_US.UTF-8"

# cleaning install (last root phase thing)
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# dbox phase
USER dbox
WORKDIR /home/dbox

# install dropbox
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
 && wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" && chmod +x dropbox.py

# as dbox, set locale
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8

# start daemon
CMD .dropbox-dist/dropboxd
