cmake_minimum_required(VERSION 3.10)
project(crowcpp)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Threads REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(Boost COMPONENTS system REQUIRED)

include_directories(/usr/local/include)
include_directories(/usr/local/include/crow)

add_executable(${PROJECT_NAME}_api src/main.cpp)

target_link_libraries(${PROJECT_NAME}_api 
    PRIVATE 
    Threads::Threads
    OpenSSL::SSL
    OpenSSL::Crypto
    Boost::system
)