FROM ubuntu:latest

MAINTAINER Sony Santos - sony.fermino(at)gmail

# install things
RUN apt-get update \
  && apt-get install -y wget gosu python3 libglib2.0-0 libatomic1 libglapi-mesa libxext6 \
     libxdamage-dev libxcb-glx0 libxcb-dri2-0 libxcb-dri3-0 libxcb-present-dev \
     libxshmfence-dev libxxf86vm-dev

# clean install
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# set locale, UID and GID: they can (and must, if necessary) be overriden by docker run -e option
ENV LANG=C.UTF-8 DBOX_UID=1000 DBOX_GID=1000

# dbox: dropbox user
RUN useradd -ms /bin/bash -d /dbox dbox

# install dropbox.py
RUN cd /opt \
 && wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" && chmod +x dropbox.py

# run entrypoint.sh
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD /dbox/.dropbox-dist/dropboxd