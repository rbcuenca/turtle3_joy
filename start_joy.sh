#!/bin/bash

source /opt/ros/humble/setup.bash
source ~/colcon_ws/install/setup.bash

ros2 daemon stop
ros2 daemon start

ros2 run joy joy_node --ros-args -p dev:=/dev/input/js0 &
sleep 1

ros2 run teleop_twist_joy teleop_node \
--ros-args \
--params-file ~/colcon_ws/config.yaml \
--remap cmd_vel:=/cmd_vel
