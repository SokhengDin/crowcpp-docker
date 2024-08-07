# CrowCPP Development Environment

This project provides a Docker-based development environment for building C++ web applications using the Crow framework.

## Prerequisites

- Docker

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/crowcpp-dev.git
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

4. Inside the container, navigate to the source directory and compile your application:
   ```
   cd /usr/src/app/src
   g++ -std=c++14 -O3 main.cpp -o api -I/usr/local/include -L/usr/local/lib -lboost_system -lpthread -lssl -lcrypto
   ```

5. Run your application:
   ```
   ./api
   ```

Your Crow application should now be running and accessible at `http://localhost:8080`.