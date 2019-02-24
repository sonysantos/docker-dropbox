#!/bin/bash

cd /dbox

# remove empty .dropbox-dist
if [[ -d ".dropbox-dist" && ! "$(ls -A .dropbox-dist)" ]]; then
  rm -rf .dropbox-dist
fi

# copy .dropbox-dist if it does not exist
if [[ ! -d ".dropbox-dist" ]]; then
  # install dropbox
  wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  chown -R $DBOX_UID:$DBOX_GID .dropbox-dist
fi

# set proper UID and GID
usermod -u $DBOX_UID dbox
usermod -g $DBOX_GID dbox

exec gosu dbox "$@"