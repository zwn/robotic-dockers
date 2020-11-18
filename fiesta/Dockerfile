FROM osrf/ros:melodic-desktop-full-bionic

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y python-catkin-tools

SHELL ["/bin/bash", "-c"]

WORKDIR /fiesta-ws/

COPY clone-src .

RUN ./clone-src

RUN catkin build
