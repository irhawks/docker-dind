# make bootstrap image for private repositories

This project is launched to enable the usage of customized configurations in docker-in-docker. Primary use cases include setting up insecure registries and registry mirrors for docker daemon running in docker-in-docker environemnt. This could help when you have no Internet connections and your target is to push images to your private (insecure) registries.

You can use this images to build your hosted docker image-targeted ci projects.

# Build

You can make two images based on docker:dind and docker:stable. the Makefile script will build and upload images to your repositories

1. specify your username and password to login

```bash
USERNAME=docker PASSWORD=docker make stable
USERNAME=docker PASSWORD=docker make dind
```

# Usage

After you have uploaded your images, you can use these images in `.gitlab.ci.yml` like this:

```yaml
image: upload.nexus.irhawks.com/irhawks/docker:stable

hello:
  stage: build
  script: echo "hello"

variables:
  DOCKER_HOST: tcp://localhost:2375/
  DOCKER_DRIVER: overlay2

services:
  - upload.nexus.irhawks.com/irhawks/docker:dind

before_script:
  - docker info

  
build:
  stage: build
  script:
    - uname -a
```
