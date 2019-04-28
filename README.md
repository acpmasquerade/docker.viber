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

# Todo
- mount host disk volume to retain viber sessions and data  
