IMAGE_NAME := molon/pbgen
IMAGE_VERSION	        ?= $(shell git describe --tags)

.PHONY: all
all: latest

.PHONY: latest
latest:
	docker build -f Dockerfile -t $(IMAGE_NAME):latest --progress=plain .

.PHONY: versioned
versioned:
	docker build -f Dockerfile -t $(IMAGE_NAME):$(IMAGE_VERSION) --progress=plain .

.PHONY: push-latest push-versioned
push-latest:
	docker push $(IMAGE_NAME):latest
push-versioned:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

.PHONY: version
version:
	@echo $(IMAGE_VERSION)
