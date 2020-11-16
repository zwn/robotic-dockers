FROM osrf/ros:melodic-desktop-full-bionic

RUN apt-get update && apt-get install -y python-wstool python-catkin-tools ros-melodic-cmake-modules protobuf-compiler autoconf libtool libtool-bin

SHELL ["/bin/bash", "-c"]

WORKDIR /voxblox-ws/

COPY init .

RUN ./init
