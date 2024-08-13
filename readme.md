# CrowCPP Development Environment

This project provides a Docker-based development environment for building C++ web applications using the Crow framework.

## Prerequisites

- Docker

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/SokhengDin/crowcpp-docker.git
   cd crowcpp-dev
   ```

2. Build the Docker image:
   ```
   docker build -t crowcpp-dev-slim .
   ```

3. Run the container:
   ```
   docker run -it -v $(pwd)/src:/usr/src/app/src -p 8080:8080 crowcpp-dev-slim
   ```

Your Crow application should now be running and accessible at `http://localhost:8080`.
