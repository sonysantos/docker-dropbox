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
RUN echo "export LANG=en_US.UTF-8" >> .bashrc

# dropbox service with selective sync
CMD ./dropbox.py start && sleep 2 && ./dropbox.py exclude add Dropbox/Projetos/* Dropbox/* && \
  ./dropbox.py exclude remove Dropbox/Projetos/web Dropbox/bkp

### END OF THE FILE ###

# RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# CMD or RUN ./dropbox.py exlcude ???
# tem que ser CMD porque não vai manter configuração sem o .dropbox no volume deseujado.
# a não ser que eu não crie um volume para ele! Gostei disso!
# desgostei! Senão, a cada build será preciso linkar um device novo.
# além disso, é preciso refazer o processo com frequencia; então CMD é melhor.

#RUN wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" && chmod +x dropbox.py
#RUN cd .dropbox-dist && ln -s dropbox-lnx.x86_64-`cat VERSION`/dropbox
#CMD ["/home/sony/.dropbox-dist/dropboxd"]
