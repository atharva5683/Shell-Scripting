OS := $(shell uname)

DOCKER_COMPOSE := docker-compose

build:
ifeq ($(OS),Linux)
	@echo "Building for Linux"
	$(DOCKER_COMPOSE) build
endif
ifeq ($(OS),Windows_NT)
	@echo "Building for Windows"
endif
ifeq ($(OS),Darwin)
	@echo "Building for macOS"
	$(DOCKER_COMPOSE) build
endif

run:
ifeq ($(OS),Linux)
	@echo "Running on Linux"
	$(DOCKER_COMPOSE) up -d
endif
ifeq ($(OS),Windows_NT)
	@echo "Running on Windows"
endif
ifeq ($(OS),Darwin)
	@echo "Running on macOS"
	$(DOCKER_COMPOSE) up -d
endif

stop:
	$(DOCKER_COMPOSE) down

clear:
	docker system prune -f

