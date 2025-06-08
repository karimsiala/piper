# Dockerfile for Piper + MoveIt2 Servo on ROS 2 Humble (Ubuntu 22.04)
FROM moveit/moveit2:humble-release

# Switch to root for installs
#USER root

# 1. Install extra ROS 2 packages
RUN apt-get update && \
    apt-get install -y \
    ros-humble-ros-base \
    ros-humble-joint-state-publisher-gui \
    ros-humble-joy \
    ros-humble-teleop-twist-joy \
    ros-humble-control* \
    ros-humble-joint-trajectory-controller \
    ros-humble-joint-state-* \
    ros-humble-gripper-controllers \
    ros-humble-trajectory-msgs \
    gazebo \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-gazebo-ros2-control \
    ros-humble-ros2-control \
    ros-humble-ros2-controllers \
    python3-colcon-common-extensions \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

# 2. Install lerobot and its dependencies TODO

