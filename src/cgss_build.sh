#!/bin/bash

################################################################################
# Script name: cgss_build.sh
# Description: This script builds or cleans the Canine Guard project 
# Usage: ./cgss_build.sh [--clean]
################################################################################

CLEAN_PARAM="--clean"

build() {
    echo ">>> Building Cyclone DDS package..."
    if [ ! -d "$CYCLONE_SRC" ]; then
        mkdir -p "$CYCLONE_SRC"
    fi
    cp -ru "$UNITREE_ROS2_PATH/$CYCLONE_SRC"/* "$CYCLONE_SRC"
    cd "$CYCLONE_SRC"
    git clone https://github.com/ros2/rmw_cyclonedds -b $ROS_DISTRO
    git clone https://github.com/eclipse-cyclonedds/cyclonedds -b releases/0.10.x
    cd ..
    colcon build --packages-select cyclonedds

    echo ">>> Building unitree ROS2 packages..."
    source "/opt/ros/$ROS_DISTRO/setup.bash"
    colcon build

    cd ..
    source "/opt/ros/$ROS_DISTRO/setup.bash"
    source "$CYCLONE_WS/install/setup.bash"

    echo ">>> Building cgss workspace packages..."
    cd "$CGSS_WS"

    # Install dependencies for the Canine Guard project
    rosdep install --from-paths src --ignore-src -r -y

    # Build the Canine Guard project
    colcon build

    # echo ">>> Testing robodog control package..."
    # colcon test
    # colcon test-result --all --verbose

    cd ..
}

clean() {
    rm -rf "$CYCLONE_WS"
    rm -rf "$CGSS_WS"/build "$CGSS_WS"/install "$CGSS_WS"/log
}

if  [ "$#" -eq 0 ] || { [ "$#" -eq 1 ] && [ "$1" == $CLEAN_PARAM ];}; then
    source "./cgss_variables.sh"
    
    if [ $# -eq 0 ]; then
        echo ">>> Building Canine Guard Project..."
        build
        echo ">>> Build finished"
    else
        echo ">>> Cleaning Canine Guard Project..."
        clean
        echo ">>> Clean finished"
    fi
else
    echo "Error when calling $(basename $0)"
    echo "Usage: $(basename $0) [--clean]"
    exit 1
fi