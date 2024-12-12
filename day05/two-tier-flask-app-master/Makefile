# Determine the operating system using the 'uname' command
# - On Linux, this will return "Linux"
# - On macOS, this will return "Darwin"
# - On Windows (with Git Bash or similar), this variable may need to be set differently
OS := $(shell uname)

# Define the docker-compose command
# This allows flexibility if the 'docker-compose' command needs to be changed or aliased
DOCKER_COMPOSE := docker-compose

# ------------------------------
# Target: build
# Description: Build Docker images based on the operating system
# ------------------------------
build:
ifeq ($(OS),Linux)
	@echo "Building for Linux"
	$(DOCKER_COMPOSE) build  # Run 'docker-compose build' on Linux
endif
ifeq ($(OS),Windows_NT)
	@echo "Building for Windows"
	# Placeholder: Add Windows-specific build commands if needed
endif
ifeq ($(OS),Darwin)
	@echo "Building for macOS"
	$(DOCKER_COMPOSE) build  # Run 'docker-compose build' on macOS
endif

# ------------------------------
# Target: run
# Description: Run Docker containers in detached mode based on the operating system
# ------------------------------
run:
ifeq ($(OS),Linux)
	@echo "Running on Linux"
	$(DOCKER_COMPOSE) up -d  # Start containers in detached mode on Linux
endif
ifeq ($(OS),Windows_NT)
	@echo "Running on Windows"
	# Placeholder: Add Windows-specific run commands if needed
endif
ifeq ($(OS),Darwin)
	@echo "Running on macOS"
	$(DOCKER_COMPOSE) up -d  # Start containers in detached mode on macOS
endif

# ------------------------------
# Target: stop
# Description: Stop and remove all Docker containers defined in docker-compose.yml
# ------------------------------
stop:
	$(DOCKER_COMPOSE) down  # Stops containers and removes them along with networks

# ------------------------------
# Target: clear
# Description: Clean up Docker system resources, such as unused images, containers, and volumes
# ------------------------------
clear:
	docker system prune -f  # Forcefully remove all unused Docker data to free up space
