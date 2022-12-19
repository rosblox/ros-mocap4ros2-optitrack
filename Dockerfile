FROM ros:humble-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-colcon-common-extensions \
    ros-humble-tf2-ros \
    ros-humble-tf2-geometry-msgs \
    ros-humble-qt-gui-cpp \
    ros-humble-rqt-gui-cpp \
    qtbase5-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /colcon_ws

COPY ./mocap_msgs src/mocap_msgs
COPY ./mocap src/mocap
COPY ./mocap4ros2_optitrack src/mocap4ros2_optitrack


WORKDIR /colcon_ws/src/mocap4ros2_optitrack/mocap_optitrack_driver
RUN pip3 install requests && python3 ./install_sdk.py


RUN . /opt/ros/${ROS_DISTRO}/setup.sh && \
    colcon build --symlink-install --event-handlers console_direct+ --cmake-args ' -DCMAKE_BUILD_TYPE=Release'

WORKDIR /

COPY ros_entrypoint.sh .

RUN echo 'alias build="colcon build --symlink-install  --event-handlers console_direct+"' >> ~/.bashrc
RUN echo 'alias run="ros2 launch mocap_optitrack_driver optitrack2.launch.py"' >> ~/.bashrc
