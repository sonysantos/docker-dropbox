#!/bin/bash

# set proper UID and GID
usermod -u $DBOX_UID dbox
usermod -g $DBOX_GID dbox

exec gosu dbox "@"