IMAGE_NAME := nextcloud
IMAGE_REGISTRY ?= ghcr.io/razzie
TAG ?= 28.0.0-apache
FULL_IMAGE_NAME := $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(TAG)

.PHONY: docker-build
docker-build:
	docker build . -t $(FULL_IMAGE_NAME)-custom --build-arg TAG=$(TAG)

.PHONY: docker-push
docker-push: docker-build
	docker push $(FULL_IMAGE_NAME)-custom
