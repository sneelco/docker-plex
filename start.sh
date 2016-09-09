#!/usr/bin/bash

set -x

PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="$HOME/Library/Application Support"
PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
PLEX_MEDIA_SERVER_TMPDIR=/tmp

LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

groupmod -g $PLEX_GID plex
usermod -u $PLEX_UID plex

/usr/bin/test -d "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}" || (/bin/mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}" && /bin/chown plex -R "$HOME")
/usr/bin/sudo -u plex -E LD_LIBRARY_PATH=/usr/lib/plexmediaserver /usr/lib/plexmediaserver/Plex\ Media\ Server

