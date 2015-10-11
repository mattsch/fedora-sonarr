# Fedora Sonarr Docker Container

Docker container for [Sonarr](https://sonarr.tv/) using Fedora.

## Usage

Create with defaults:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -p 6789:6789 --name=sonarr mattsch/fedora-sonarr
```

Create with a custom uid/gid for the sonarr daemon:

```bash
docker create -v /path/to/config/dir:/config \
    -v /path/to/storage/dir:/storage \
    -v /etc/localtime:/etc/localtime:ro \
    -e LUID=1234 -e LGID=1234 \
    -p 6789:6789 --name=sonarr mattsch/fedora-sonarr
```

Using host networking rather than the port forwards above will give the best
performance.  However, this allows the container to have full access to the
host's networking stack.  Be sure you understand the implications before using
it.

