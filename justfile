_tmux_split_window:
    #!/bin/bash
    
    # Kill the tmux session if it already exists
    tmux has-session -t docker-demo 2>/dev/null && tmux kill-session -t docker-demo

    # Create a new tmux session, detached
    tmux new-session -d -s docker-demo

    # Split the window into two panes
    tmux split-window -h

# Run talker and listener in a single Docker network - minimal example
docker-network-only:
    docker compose -f compose.docker-network-only.yaml up

# Run the talker in a Docker container and the listener on the host machine
host-docker: _tmux_split_window
    #!/bin/bash
    # Select the first pane and run the Docker compose command
    tmux send-keys -t docker-demo:0.0 'docker compose -f compose.host-docker.yaml up' C-m

    # Select the second pane and run the ROS command
    tmux send-keys -t docker-demo:0.1 'ros2 run demo_nodes_cpp listener' C-m

    # Attach to the tmux session
    tmux attach-session -t docker-demo

# Run talker and listener in Docker connected over the Internet with Husarnet VPN (Discovery Server Config)
husarnet-discovery-server: _tmux_split_window
    #!/bin/bash
    tmux send-keys -t docker-demo:0.0 'docker compose -f compose.husarnet-listener.yaml up' C-m
    tmux send-keys -t docker-demo:0.1 'docker compose -f compose.husarnet-talker.yaml up' C-m

    # Attach to the tmux session
    tmux attach-session -t docker-demo

[private]
default:
  @just --list --unsorted