FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget
RUN useradd -ms /bin/bash sony
USER sony
WORKDIR /home/sony
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

RUN cd .dropbox-dist && ln -s dropbox-lnx.x86_64-`cat VERSION`/dropbox

#CMD ["/home/sony/.dropbox-dist/dropboxd"]
