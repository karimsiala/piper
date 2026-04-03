# Dockerfile for Piper + MoveIt2 Servo on ROS 2 Humble (Ubuntu 22.04)
FROM ros:humble

# Switch to root for installs
#USER root

# 1. Install extra ROS 2 packages
RUN apt-get update && \
    apt-get install -y \
    ros-humble-ros-base \
    ros-humble-moveit \
    ros-humble-rqt* \
    ros-humble-joint-state-publisher-gui \
    ros-humble-joy \
    ros-humble-teleop-twist-joy \
    ros-humble-ros2-control \
    ros-humble-ros2-controllers \
    ros-humble-joint-trajectory-controller \
    ros-humble-joint-state-* \
    ros-humble-gripper-controllers \
    ros-humble-trajectory-msgs \
    ros-humble-controller-manager \
    python3-colcon-common-extensions \
    python3-pip \
    ethtool \
    can-utils \
    iproute2 && \
    pip3 install piper_sdk python-can && \
    rm -rf /var/lib/apt/lists/*

# 2. Install lerobot and its dependencies TODO

# Copy and set up the entrypoint script
COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

# Add ROS sourcing to bashrc for interactive shells
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc && \
    echo "if [ -f /workspace/install/setup.bash ]; then source /workspace/install/setup.bash; fi" >> /root/.bashrc

