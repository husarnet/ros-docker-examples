FROM ros:iron-ros-core

RUN apt update && apt install -y \
        ros-${ROS_DISTRO}-demo-nodes-cpp && \
    rm -rf /var/lib/apt/lists/*