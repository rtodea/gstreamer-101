cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(gstreamer-101 VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(SOURCES src/main.cpp)

add_executable(gstreamer-101 ${SOURCES})

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake-modules)
find_package(PkgConfig REQUIRED)
find_package(GStreamer)
pkg_check_modules(REQUIRED gstreamer-1.0)
pkg_check_modules(GLIB2 glib-2.0 REQUIRED)
if (GStreamer_FOUND)
    message(STATUS "FOUND!!")
endif ()
message(${GSTREAMER_INCLUDE_DIRS})
