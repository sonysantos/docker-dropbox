FROM ubuntu:16.04

# root phase
# install things
RUN apt-get update && apt-get install -y wget python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python

# sony user
RUN useradd -ms /bin/bash sony

# locale
RUN locale-gen "en_US.UTF-8"

# cleaning install (last root phase thing)
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# sony phase
USER sony
WORKDIR /home/sony

# install dropbox
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
 && wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" && chmod +x dropbox.py

# sony locale
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8

# start daemon
CMD .dropbox-dist/dropboxd
