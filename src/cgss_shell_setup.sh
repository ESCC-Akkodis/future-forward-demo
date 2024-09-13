#!/bin/bash

################################################################################
# Script name: cgss_shell_setup.sh
# Description: This script sets the environment for the Canine Guard Project
# Usage: source ./cgss_shell_setup.sh [--sim]
################################################################################

SIM_PARAM="--sim"

if  [ "$#" -eq 0 ] || { [ "$#" -eq 1 ] && [ "$1" == $SIM_PARAM ];}; then
    echo ">>> Setting Canine Guard Project environment..."

    source "./cgss_variables.sh"

    source "/opt/ros/$ROS_DISTRO/setup.bash"
    source "$CYCLONE_WS/install/setup.bash"

    if [ $# -eq 1 ]; then
    echo ">>> Setting Canine Guard Project for simulation..."
        unset CYCLONEDDS_URI
    fi

    echo ">>> Setting environment finished"
else
    echo "Error when calling $(basename $0)"
    echo "Usage: $(basename $0) [$SIM_PARAM]"
    exit 1
fi