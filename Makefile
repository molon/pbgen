IMAGE_NAME := molon/pbgen

.PHONY: build-v1
build-v1:
	docker build -f Dockerfile-v1 -t $(IMAGE_NAME):v1 --progress=plain .

.PHONY: push-v1
push-v1:
	docker push $(IMAGE_NAME):v1