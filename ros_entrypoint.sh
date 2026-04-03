#!/bin/bash
set -e
source /opt/ros/humble/setup.bash
# Source workspace if it's built
if [ -f /workspace/install/setup.bash ]; then
    source /workspace/install/setup.bash
fi
exec "$@"
