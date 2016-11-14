# Dropbox container

## 1. Pulling the image

Tags:
* `0.1`, `latest`

Command:

    docker pull sonysantos/docker-dropbox:latest


## 2. First run
First run must be with `-it` options to show the URL to link your host to your Dropbox account:

    docker run -it --rm --name dropbox-first-run -v $HOME/Dropbox:/home/dbox/Dropbox \
      -v $HOME/.dropbox:/home/dbox/.dropbox sonysantos/docker-dropbox:latest


You shall see a message like that:

    This computer isn't linked to any Dropbox account...
    Please visit LINK_URL to link this device.


Depending on your terminal, you can CTRL+Click in the URL to open it in a web browser.

On success you'll get this message:

    This computer is now linked to Dropbox. Welcome User


After that, you can stop it with `docker stop dropbox-first-run` and you can start it as a daemon (below).

## 3. Run as a daemon (main use)

Next times you'll want run the image only as a daemon:

    docker run -d --name my-dropbox -v $HOME/Dropbox:/home/dbox/Dropbox \
      -v $HOME/.dropbox:/home/dbox/.dropbox sonysantos/docker-dropbox:latest


Based on Ubuntu:16.04 image.