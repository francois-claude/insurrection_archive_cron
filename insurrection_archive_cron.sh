#!/bin/bash

DESTDIR='/mnt/nfs/backups/media/other/trump_protest_2021_capital/mirror'
LOGFILE='/home/fclaude/Nextcloud/homelab/scripts/threadripper/wget_capitol_footage.log'
URLFETCH='https://capitol-hill-riots.s3.us-east-1.wasabisys.com/directory.html'

set -e

cd "$DESTDIR"

if [ ! -f "$LOGFILE" ]; then
  /usr/bin/touch "$LOGFILE"
else
  cat /dev/null > "$LOGFILE"
fi

/usr/bin/wget \
  --recursive \
  --level 'inf' \
  --no-clobber \
  --continue \
  --no-parent \
  --output-file="$LOGFILE" \
"$URLFETCH"

