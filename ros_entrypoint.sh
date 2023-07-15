#!/bin/bash
set -e

adduser --quiet --disabled-password --gecos '' --uid ${UID} --uid ${GID} ros

source /opt/ros/${ROS_DISTRO}/setup.bash
source /colcon_ws/install/setup.bash

exec "$@"