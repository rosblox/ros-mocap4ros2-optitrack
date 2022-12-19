FROM --platform=arm64 dustynv/ros:humble-ros-base-l4t-r35.1.0

RUN cd /tmp && \
    apt update && apt install -y --no-install-recommends \
    xxx \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /colcon_ws


COPY ./zed-ros2-wrapper src/zed-ros2-wrapper




RUN . /opt/ros/${ROS_DISTRO}/install/setup.sh && \
    colcon build --symlink-install --event-handlers console_direct+ --base-paths src --cmake-args ' -DCMAKE_BUILD_TYPE=Release'

WORKDIR /

COPY ros_entrypoint.sh .

RUN echo 'alias build="colcon build --symlink-install  --event-handlers console_direct+"' >> ~/.bashrc
RUN echo 'alias run="ros2 launch mocap_optitrack_driver optitrack2.launch.py"' >> ~/.bashrc
