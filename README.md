# Fedora Sonarr Docker Container

Docker container for [Sonarr](https://sonarr.tv/) using Fedora.
This uses the update script from [tuxeh](https://github.com/tuxeh/docker-sonarr)
so you'll need to adjust the update settings to use `/bin/update-sonarr.sh`.

## Usage

Create with defaults:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -p 8989:8989 --name=sonarr mattsch/fedora-sonarr
```

Create with a custom uid/gid for the sonarr daemon:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -e LUID=1234 -e LGID=1234 \
    -p 8989:8989 --name=sonarr mattsch/fedora-sonarr
```

Using host networking rather than the port forwards above will give the best
performance.  However, this allows the container to have full access to the
host's networking stack.  Be sure you understand the implications before using
it.

