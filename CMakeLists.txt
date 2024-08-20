cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(gstreamer-101 VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(gstreamer-101 src/main.cpp)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake-modules)
find_package(PkgConfig REQUIRED)
find_package(GStreamer)
pkg_check_modules(REQUIRED gstreamer-1.0)
pkg_check_modules(GLIB2 glib-2.0 REQUIRED)
if (GStreamer_FOUND)
    message(STATUS "FOUND!!")
    message(STATUS ${GLIB2_LIBRARIES})
    message(STATUS ${GLIB2_INCLUDE_DIRS})
    message(STATUS ${GSTREAMER_LIBRARIES})
    message(STATUS ${GSTREAMER_INCLUDE_DIRS})
    message(STATUS "FOUND!!")
endif ()
include_directories(
        ${GLIB2_INCLUDE_DIRS}
        /usr/include/gstreamer-1.0)

link_directories(
        /usr/include/gstreamer-1.0/gst)

add_executable(basic-tutorial-1 src/basic-tutorial-1.c)
target_link_libraries(basic-tutorial-1 PUBLIC
        ${GSTREAMER_LIBRARIES}
        ${GLIB2_LIBRARIES})