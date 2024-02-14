#!/bin/bash

if [ -z "$IGN_VERSION" ]; then
    export IGN_GAZEBO_RESOURCE_PATH=`pwd`/src/${IGN_GAZEBO_RESOURCE_PATH:+:${IGN_GAZEBO_RESOURCE_PATH}}
    export IGN_VERSION=fortress
    export IGN_GAZEBO_SYSTEM_PLUGIN_PATH=`pwd`/install/lib${IGN_GAZEBO_SYSTEM_PLUGIN_PATH:+:${IGN_GAZEBO_SYSTEM_PLUGIN_PATH}}
    export ROS_LOCALHOST_ONLY=1
fi

colcon build --merge-install --cmake-args -DBUILD_TESTING=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON --packages-select d1
source /opt/ros/humble/setup.bash
source `pwd`/install/setup.bash
