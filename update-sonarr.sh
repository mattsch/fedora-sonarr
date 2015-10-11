#!/usr/bin/env bash

# From https://github.com/tuxeh/docker-sonarr
# 52 /tmp/nzbdrone_update /opt/NzbDrone/NzbDrone.exe

echo "updating sonarr"
rm -Rfv /opt/NzbDrone/*
mv $2/NzbDrone/* /opt/NzbDrone/

echo "sending term to sonarr, configure docker to automatically restart this container"
kill $1
