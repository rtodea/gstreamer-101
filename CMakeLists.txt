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
include_directories(
        ${GLIB2_INCLUDE_DIRS}
        /usr/lib/x86_64-linux-gnu/glib-2.0/include
        /usr/lib/x86_64-linux-gnu/gstreamer-1.0/include
        /usr/include/gstreamer-1.0
)

link_directories(
        /usr/include/gstreamer-1.0/gst)

add_executable(basic-tutorial-1 src/basic-tutorial-1.c)
target_link_libraries(basic-tutorial-1 PUBLIC
        ${GSTREAMER_LIBRARIES}
        ${GLIB2_LIBRARIES})