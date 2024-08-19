cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(gstreamer-101 VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(SOURCES src/main.cpp)

add_executable(gstreamer-101 ${SOURCES})