CURRENT_DIR = $(shell echo "$$(pwd)")
CURRENT_USER = $(shell echo "$$(id -u)")
CURRENT_GROUP = $(shell echo "$$(id -g)")

# --user $(CURRENT_USER):$(CURRENT_GROUP)

docker-image:
	mkdir -p ./temp/empty_directory
	docker build -t flutter-builder -f builder.Dockerfile ./temp/empty_directory
	rm -rf ./temp/empty_directory

start:
	docker run  -d --rm  --workdir /src  --name flutter-build -v $(CURRENT_DIR)/flbuild:/build flutter-builder python /build/wait.py

stop:
	docker exec -it flutter-build touch /src/completed.txt

build-engine: 
	docker exec -it flutter-build bash /build/build.sh

clone-engine:
	docker exec -it flutter-build git clone -b dev/textures https://github.com/wechat-miniprogram/engine.git src/flutter

copy-binaries:
	mkdir -p $(CURRENT_DIR)/output
	docker cp flutter-build:/src/src  $(CURRENT_DIR)/output