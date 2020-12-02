#FROM ubuntu:18.04
FROM osrf/ros:melodic-desktop-full


# Do not install "recommends"
RUN echo 'APT::Install-Recommends "0";\nAPT::Install-Suggests "0";' > /etc/apt/apt.conf.d/01norecommend

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility

RUN apt-get update \
    && apt-get install -y \
        libqglviewer-dev-qt5 \
        python-catkin-tools \
        ros-melodic-libg2o \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# these dependencies allow to build FROM ubuntu:18.04 image
#RUN apt-get update \
#    && apt-get install -y \
#        build-essential \
#        ca-certificates \
#        freeglut3-dev \
#        git \
#        libeigen3-dev \
#        libopencv-dev \
#        libqglviewer-dev-qt5 \
#        libsuitesparse-dev \
#        libyaml-cpp-dev \
#        ninja-build \
#        python-catkin-tools \
#        python-setuptools \
#    && apt-get autoremove -y \
#    && apt-get clean -y \
#    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

WORKDIR /proslam-ws/

COPY clone-src .

RUN ./clone-src

RUN G2O_ROOT=/opt/ros/melodic/ catkin build srrg_proslam

# support `docker exec -it <container> bash
RUN echo "source /proslam-ws/devel/setup.sh" >> ~/.bashrc

COPY entrypoint.sh ./

ENTRYPOINT [ "/proslam-ws/entrypoint.sh" ]

CMD [ "bash" ]
