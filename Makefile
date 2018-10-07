MIRROR_SITE=upload.docker.nexus.irhawks.com
DOCKER_USERNAME=$(USERNAME)
DOCKER_PASSWORD=$(PASSWORD)
USER=irhawks

IMAGE_PREFIX=${MIRROR_SITE}/${USER}

.PHONY: login dind stable

login:
	docker login --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD} ${MIRROR_SITE}


dind: login
	cd $@ && docker build -t ${IMAGE_PREFIX}/docker:$@ .
	docker push ${IMAGE_PREFIX}/docker:$@


stable: login
	cd $@ && docker build -t ${IMAGE_PREFIX}/docker:$@ .
	docker push ${IMAGE_PREFIX}/docker:$@
	
