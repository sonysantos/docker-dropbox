FROM ubuntu:16.04

# root phase

# install things
RUN apt-get update && apt-get install -y python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python

# sony user
RUN useradd -ms /bin/bash sony

# locale
RUN locale-gen "en_US.UTF-8"

# cleaning install (last root phase thing)
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# sony phase
USER sony
WORKDIR /home/sony

# files
ADD dropbox-dist.tgz .
COPY dropbox.py .

# sony locale
# RUN echo "export LANG=en_US.UTF-8" >> .bashrc
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# dropbox service with selective sync
CMD ./dropbox.py start && sleep 3 && ./dropbox.py exclude add Dropbox/Projetos/* Dropbox/* && \
  ./dropbox.py exclude remove Dropbox/Projetos/web Dropbox/bkp
