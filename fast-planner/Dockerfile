ARG ROS_DISTRO
FROM osrf/ros:${ROS_DISTRO}-desktop-full

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y libarmadillo-dev ros-${ROS_DISTRO}-nlopt

SHELL ["/bin/bash", "-c"]

WORKDIR /fast-planner-ws/

COPY clone-src fp.patch ./

RUN ./clone-src

RUN source /opt/ros/${ROS_DISTRO}/setup.bash && catkin_make -DCMAKE_BUILD_TYPE=Release
