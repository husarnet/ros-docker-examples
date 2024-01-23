# ros-docker-examples

Examples showing how to run ROS 2 in Docker Containers on the same host and connected over the Internet

> [!NOTE]
> To simplify the execution of this project, we are utilizing [just](https://github.com/casey/just).
>
> Install it with:
>
> ```
> curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | sudo bash -s -- --to /usr/bin
> ```

## Quick Start

### Husarnet VPN Setup

1. Setup a free account at [app.husarnet.com](https://app.husarnet.com/), create a new Husarnet network, click the **[Add element]** button and copy the code from the **Join Code** tab.
2. Save the Join Code to the `.env` file in this folder

### Running Examples

```bash
$ just --list
Available recipes:
    docker-network-only       # Run talker and listener in a single Docker network - minimal example
    host-docker               # Run the talker in a Docker container and the listener on the host machine
    husarnet-discovery-server # Run talker and listener in Docker connected over the Internet with Husarnet VPN (Discovery Server Config)
```

eg. to run `docker-network-only` setup execute:

```bash
just docker-network-only
```