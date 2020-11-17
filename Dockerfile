FROM osrf/ros:melodic-desktop-full-bionic

# libtool-bin not in install instructions but glog_catkin needs them
RUN apt-get update && apt-get install -y python-wstool python-catkin-tools ros-melodic-cmake-modules protobuf-compiler autoconf libtool-bin

SHELL ["/bin/bash", "-c"]

WORKDIR /voxblox-ws/

COPY clone-src .

RUN ./clone-src

RUN catkin build
