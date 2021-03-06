#!/bin/sh
# Copyright (c) Facebook, Inc. and its affiliates. All Rights Reserved

# Could be called by DPKG or RPM.
# Handle the cases we want to hook or silently claim success.
case "$1" in
  configure|2)
    : # Fall through to systemctl handle.
    ;;
  *)
    exit 0
    ;;
esac

# If we have a systemd, daemon-reload away now
if [ -x /bin/systemctl ] && pidof systemd ; then
  /bin/systemctl daemon-reload 2>/dev/null 2>&1
fi
