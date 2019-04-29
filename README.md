# docker.viber
Run Viber on Docker

Successfully tested on following machines
- Ubuntu 19.04
- 

# With Docker Compose

```
docker-compose build
docker-compose up
```

# Without docker compose
```
docker build . -t viber
docker run  \
       -v /dev/snd:/dev/snd \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       --privileged  \
       -e DISPLAY=$DISPLAY \
       viber:latest
```

# Viber Session and Downloads
Two volume directories are mounted from the host local folder
- ViberDownloads to /home/gui/Documents/ViberDownloads
- viber`SomeNumberWithCountryCode` to /home/gui/viber`SomeNumberWithCountryCode` (eg. viber977980000000)
