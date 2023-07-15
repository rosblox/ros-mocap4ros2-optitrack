docker run -it --rm --network=host \
--workdir=/colcon_ws \
--volume $(pwd)/mocap:/colcon_ws/src/mocap \
--volume $(pwd)/mocap_msgs:/colcon_ws/src/mocap_msgs \
--volume $(pwd)/mocap4ros2_optitrack:/colcon_ws/src/mocap4ros2_optitrack \
--ipc=host --pid=host \
--mount type=tmpfs,destination=/.ros,tmpfs-mode=0777 \
--env UID=$(id -u) \
--env GID=$(id -g) \
ghcr.io/rosblox/ros-mocap4ros2-optitrack:humble