# docker-xxrdb
A simple docker container with xfce5 and xrdp, based on ubuntu:resolute

# usage
Fix docker-compose.yml replace CHANGETOUSER to your username.
Simple command for that: `sed -i "s:CHANGETOUSER:$(id -u -n):g" docker-compose.yml`

## Optional: mount your home into the container:
remove the comment in the docker-compose.yml, your home will be a subfolder of your home in your remote session.
The idea is to not poison you dot-files. If you want to bring that in, just fix the volume mount.

## run the container
```bash
docker compose build
docker compose up
```

now connect with mstsc or remmina or something else.

# Notes:
* If you have ideas what to change and update have fun.

