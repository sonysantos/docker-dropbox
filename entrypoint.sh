#!/bin/bash

# remove empty .dropbox-dist
if [[ -d "/dbox/.dropbox-dist" && ! "$(ls -A /dbox/.dropbox-dist)" ]]; then
  rm -rf /dbox/.dropbox-dist
fi

# copy .dropbox-dist if it does not exist
if [[ ! -d "/dbox/.dropbox-dist" ]]; then
  cd /opt
  cp -r .dropbox-dist /dbox/
  chown $DBOX_UID:$DBOX_GID /dbox/.dropbox-dist
fi

cd /dbox

# set proper UID and GID
usermod -u $DBOX_UID dbox
usermod -g $DBOX_GID dbox

# avoid downloading dropbox updates
chmod a-w .

exec gosu dbox "$@"