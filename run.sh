docker run -it --privileged --rm --net=host \
--workdir=/colcon_ws \
--volume $(pwd)/mocap:/colcon_ws/src/mocap \
--volume $(pwd)/mocap_msgs:/colcon_ws/src/mocap_msgs \
--volume $(pwd)/mocap4ros2_optitrack:/colcon_ws/src/mocap4ros2_optitrack \
ghcr.io/rosblox/ros-mocap4ros2-optitrack:humble
