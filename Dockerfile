FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget ; \
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

CMD ["/root/.dropbox-dist/dropboxd"]
