# Piper Robot Arm - ROS2 Workspace

## Docker Setup

### Prerequisites
- Docker and Docker Compose
- USB-to-CAN adapter (for real robot)
- Xbox controller (optional, for teleoperation)

### Build and Run

```bash
# Allow X11 forwarding for GUI
xhost +local:docker

# Build and start container
docker compose up -d

# Enter container
docker exec -it piper_ros_container bash
```

### Build the Workspace (inside container)

```bash
cd /workspace
colcon build
source install/setup.bash
```

### CAN Bus Setup (on host, before starting container)

```bash
sudo ip link set can0 type can bitrate 1000000
sudo ip link set can0 up
```

### Launch Commands (inside container)

```bash
# Real robot control
ros2 launch piper start_single_piper.launch.py can_port:=can0 auto_enable:=false gripper_exist:=true

# With RViz visualization
ros2 launch piper start_single_piper_rviz.launch.py

# Enable the robot
ros2 service call /enable_srv piper_msgs/srv/Enable enable_request:\ true\
```
