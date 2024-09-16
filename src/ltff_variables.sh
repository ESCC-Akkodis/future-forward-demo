
#!/bin/bash

################################################################################
# Script name: ltff_variables.sh
# Description: This script holds the ROS2 Canine Guard variables
# Usage: source ./ltff_variables.sh
################################################################################


# ROS 2 version
ROS_DISTRO="foxy"

# network interface
NET_IF="$(ip addr | awk '/inet 192\.168\.123\./ {print $NF}' | head -n 1)"
if [ -z "$NET_IF" ]; then
    NET_IF="enp0s3"
fi

# unitree_ros2 relative path
UNITREE_ROS2_PATH="../3rdparty/unitree_ros2"

# Cyclone DDS workspace
CYCLONE_WS="cyclonedds_ws"

# src directory for Cyclone DDS workspace
CYCLONE_SRC="$CYCLONE_WS/src"

# ltff workspace
LTFF_WS="ltff_ws"

# ROS2 middleware
RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# cyclone dds uri
CYCLONEDDS_URI='<CycloneDDS><Domain><General><Interfaces>
                    <NetworkInterface name="'$NET_IF'" priority="default" multicast="default" />
                </Interfaces></General></Domain></CycloneDDS>'