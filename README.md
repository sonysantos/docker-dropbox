# Dropbox container

## 1. Pulling the image

Command:

    docker pull sonysantos/dropbox:latest


## 2. First run
First run must be with `-it` options to show the URL to link your host to your Dropbox account:

    docker run -it --rm --name dropbox-first-run -v $HOME/Dropbox:/dbox/Dropbox \
      -v $HOME/.dropbox:/dbox/.dropbox sonysantos/dropbox:latest


You shall see a message like that:

    This computer isn't linked to any Dropbox account...
    Please visit LINK_URL to link this device.


Depending on your terminal, you can CTRL+Click in the URL to open it in a web browser, or just copy the LINK_URL and open it in a web browser.

On success you'll get this message:

    This computer is now linked to Dropbox. Welcome User


After that, you can stop it with `docker stop dropbox-first-run` and you can start it as a daemon (below).

**Note:** you can use another base directory than $HOME, but you must remember to replace it in all examples in this page.

## 3. Run as a daemon (main use)

Next times you'll want run the image only as a daemon:

    docker run -d --name my-dropbox -v $HOME/Dropbox:/dbox/Dropbox \
      -v $HOME/.dropbox:/dbox/.dropbox sonysantos/dropbox:latest


Based on Ubuntu:16.04 image.
