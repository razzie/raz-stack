IMAGE_NAME := pizzabot
IMAGE_REGISTRY ?= razzquez
VERSION := latest
FULL_IMAGE_NAME := $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(VERSION)

.PHONY: docker-build
docker-build:
	docker build . -t $(FULL_IMAGE_NAME)

.PHONY: docker-push
docker-push: docker-build
	docker push $(FULL_IMAGE_NAME)
