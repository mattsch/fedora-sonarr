#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u sonarr )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} sonarr
fi

if [ "$( id -g sonarr )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} sonarr
fi

# Set permissions
chown -R sonarr:sonarr /config/ /opt/NzbDrone

exec runuser -l sonarr -c '/usr/bin/mono /opt/NzbDrone/app/NzbDrone.exe -nobrowser'
