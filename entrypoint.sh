#!/bin/bash

# test .dropbox-dist
if [[ ! -d "/dbox/.dropbox-dist" ]]; then
  mkdir /dbox/.dropbox-dist
  chown $DBOX_UID:$DBOX_GID /dbox/.dropbox-dist
fi

# fill it if empty
if [[ ! "$(ls -A /dbox/.dropbox-dist)" ]]; then
  cd /dbox/.dropbox-initial-dist
  cp -rp * /dbox/.dropbox-dist/
fi

# set proper UID and GID
usermod -u $DBOX_UID dbox
usermod -g $DBOX_GID dbox

exec gosu dbox "$@"