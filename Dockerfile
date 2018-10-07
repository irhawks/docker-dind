FROM docker:dind

CMD mkdir -p /etc/docker

COPY daemon.json /etc/docker/daemon.json

# CMD echo '{ "insecure-registries" : [ "upload.docker.nexus.irhawks.com" ] }' > /etc/docker/daemon.json

# CMD docker login --username docker --password docker upload.docker.nexus.irhawks.com