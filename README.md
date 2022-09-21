# Dropbox container

## 1. Pulling the image

Command:

    docker pull sonysantos/dropbox:latest


## 2. First run

First run must be with `-it` options to show the URL to link your host to your Dropbox account:

    docker run -it --rm --name=dbox \
      -v $HOME/dropbox-containers/dbox:/dbox \
      -e DBOX_UID=`id -u` -e DBOX_GID=`id -g` \
      sonysantos/dropbox:latest


You shall see a message like that:

    This computer isn't linked to any Dropbox account...
    Please visit LINK_URL to link this device.


Depending on your terminal, you can CTRL+Click in the URL to open it in a web browser, or just copy the LINK_URL and open it in a web browser.

On success you'll get this message:

    This computer is now linked to Dropbox. Welcome User


After that, you can stop it with `docker stop dbox` and you can start it as a daemon (below).

**Note:** you can use another base directory than the example ($HOME/dropbox-containers/dbox), but you must remember to replace it in all examples in this page.

## 3. Run as a daemon (main use)

Next times you'll want run the image only as a daemon:

    docker run -d --name dbox --restart=always \
      -v $HOME/dropbox-containers/dbox:/dbox \
      -e DBOX_UID=`id -u` -e DBOX_GID=`id -g` \
      sonysantos/dropbox:latest


## Tip for github users

If you pulled the project from github, you may want to use the `run-dbox` script. It will generate the proper docker command automatically and execute it. All examples below assume that you are in the project directory. To see more details, type

    ./run-dbox -h

### First run

To run in the interactive mode to show the URL to link your host to your Dropbox account, type

    ./run-dbox -i

or

    ./run-dbox --interactive

### Run as a daemon

To run as a daemon you can simply type

    ./run-dbox

### Run other dropbox accounts in paralell

To run other dropbox accounts in paralell, simply append a nickname for the dropbox account to the examples above. (You must call the script once for each dropbox account.)

    ./run-dbox -i personal-account  # interactive
    ./run-dbox project-y            # daemon

### Enter into the container

To enter into the dropbox container (e.g., to see what's going on):

    ./enter [<container_name>]      # container_name defaults to dbox

### Clean /tmp folder inside container

    ./clean-tmp [<container_name>]   # container_name defaults to dbox

## General info

Based on Ubuntu:16.04 image.
