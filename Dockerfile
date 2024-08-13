# Build stage
FROM alpine:3.14 AS builder

RUN apk add --no-cache \
    gcc \
    g++ \
    cmake \
    make \
    git \
    boost-dev \
    openssl-dev \
    zlib-dev \
    linux-headers

RUN git clone https://github.com/chriskohlhoff/asio.git && \
    cd asio && \
    git checkout asio-1-18-1 && \
    cp -r asio/include/asio.hpp /usr/include && \
    cp -r asio/include/asio /usr/include

WORKDIR /usr/src
RUN git clone https://github.com/CrowCpp/Crow.git && \
    mkdir -p /usr/local/include/crow && \
    cp -r Crow/include/* /usr/local/include/crow/

FROM alpine:3.14

RUN apk add --no-cache \
    libstdc++ \
    boost-dev \
    openssl-dev \
    zlib-dev \
    gcc \
    g++ \
    gdb \
    vim \
    bash \
    cmake \
    make \
    linux-headers

COPY --from=builder /usr/local/include /usr/local/include
COPY --from=builder /usr/include/asio.hpp /usr/include/
COPY --from=builder /usr/include/asio /usr/include/asio

WORKDIR /usr/src/app

VOLUME /usr/src/app/src

ENV CC=gcc
ENV CXX=g++

EXPOSE 8080

# Copy CMakeLists.txt from the current directory
COPY ./CMakeLists.txt /usr/src/app/CMakeLists.txt

# Copy the entrypoint script
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]