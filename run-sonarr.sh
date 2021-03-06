#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u sonarr )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} sonarr
fi

if [ "$( id -g sonarr )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} sonarr
fi

# Fix for silly mono/mediainfo libs
if [ ! -f /usr/lib64/libmediainfo.so.0 ]; then
    ln -s /usr/lib64/libmediainfo.so.17 /usr/lib64/libmediainfo.so.0
fi

# Set permissions
chown -R sonarr:sonarr /config/ /opt/NzbDrone

export XDG_CONFIG_HOME="/config/sonarr"

exec runuser -l sonarr -c '/usr/bin/mono /opt/NzbDrone/NzbDrone.exe -nobrowser -data=/config/sonarr'
