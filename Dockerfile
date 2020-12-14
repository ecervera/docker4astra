FROM ros:kinetic-ros-base

RUN apt-get update && apt-get install -y \
    ros-kinetic-rgbd-launch ros-kinetic-libuvc \
    ros-kinetic-libuvc-camera ros-kinetic-libuvc-ros \
    && rm -rf /var/lib/apt/lists/*

ENV ROS_WS /opt/ros_ws
RUN mkdir -p $ROS_WS/src
WORKDIR $ROS_WS

RUN git -C src clone https://github.com/orbbec/ros_astra_camera

SHELL ["/bin/bash", "-c"]

RUN source /opt/ros/kinetic/setup.bash && catkin_make -j1

