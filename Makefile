build:
	docker build ${DOCKER_BUILD_OPTS} ${DOCKER_BUILD_ARGS} -t "saikocat/lsif-py:${LATEST_RELEASE_VERSION}" -f Dockerfile .

lint:
	docker run --rm --privileged -v ${PWD}:/root/ projectatomic/dockerfile-lint dockerfile_lint -p -f Dockerfile

push-registry:
	docker tag saikocat/lsif-py:${LATEST_RELEASE_VERSION} saikocat/lsif-py:${LATEST_RELEASE_VERSION}
	docker push saikocat/lsif-py:${LATEST_RELEASE_VERSION}
	docker tag saikocat/lsif-py:${LATEST_RELEASE_VERSION} saikocat/lsif-py:latest
	docker push saikocat/lsif-py:latest
