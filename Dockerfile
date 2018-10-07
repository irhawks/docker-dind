FROM docker:dind

mkdir -p /etc/docker

echo '{ "insecure-registries" : [ "upload.docker.nexus.irhawks.com" ] }' > /etc/docker/daemon.json

# docker login --username docker --password docker upload.docker.nexus.irhawks.com