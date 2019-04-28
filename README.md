# docker.viber
Run Viber on Docker (Tested on Ubuntu 19.04)

# With Docker Compose
## build 
```docker-compose build```

## run
```docker-compose up```

# Without docker compose
```
$ docker build . -t viber
$ docker run  -v /dev/snd:/dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix --privileged  -e DISPLAY=$DISPLAY viber:latest
```
