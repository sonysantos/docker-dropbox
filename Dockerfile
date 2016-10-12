FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget python2.7 && ln -s /usr/bin/python2.7 /usr/bin/python
RUN useradd -ms /bin/bash sony
USER sony
WORKDIR /home/sony
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

COPY dropbox.py .

#CMD ./dropbox.py start && sleep 2 && ./dropbox.py exclude add * && ./dropbox.py exclude remove Projetos/web bkp

# CMD or RUN ./dropbox.py exlcude ???
# tem que ser CMD porque não vai manter configuração sem o .dropbox no volume deseujado.
# a não ser que eu não crie um volume para ele! Gostei disso!
# desgostei! Senão, a cada build será preciso linkar um device novo.
# além disso, é preciso refazer o processo com frequencia; então CMD é melhor.

#RUN wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" && chmod +x dropbox.py
#RUN cd .dropbox-dist && ln -s dropbox-lnx.x86_64-`cat VERSION`/dropbox
#CMD ["/home/sony/.dropbox-dist/dropboxd"]
