# PIPE Network Node Docker

This repository provides a Docker solution for running a PIPE Network node v0.2.8+ when you already have web servers (Nginx/Apache) using ports 80 and 443.

## Problem Solved

PIPE Network node v0.2.8+ requires ports 80, 443, and 8003 to be available. If you're already running web servers on ports 80/443, this Docker solution allows you to run your PIPE node without conflicts.

## Requirements

* Docker installed on your system
* Your public key (adress solana)
* Open ports (8003, and optionally 8080, 8443)

## Quick Start

1. Clone this repository
```
git clone https://github.com/krimdev/pipe-devnet-docker.git
cd pipe-node-docker
```

2. Edit the Dockerfile
Replace YOUR_PUBLIC_KEY with your actual solana adress.

3. Build the Docker image
```
docker build -t popnode .
```

4. Run the container with data persistence
```
docker run -d --name popnode -v $HOME/pipe_data:/app -p 8003:8003 -p 8080:80 -p 8443:443 popnode
```

This maps:
* Port 8003 directly (required for node connectivity tests)
* Container's port 80 to host's port 8080
* Container's port 443 to host's port 8443

## Data Persistence

All node data is stored in the `$HOME/pipe_data` directory on your host machine, including:
* `node_info.json`
* `download_cache` directory
* Any other files created by the node

This ensures your node data persists even if the container is removed or recreated.

## Managing Your Node

View logs
```
docker logs popnode
```

Restart the node
```
docker restart popnode
```

Stop the node
```
docker stop popnode
```

Remove the container
```
docker rm popnode
```

## Updating

When a new version of PIPE Network is released:
1. Edit the Dockerfile to update the version number in the URL
2. Rebuild the image: 
```
docker build -t popnode .
```
3. Stop and remove the old container: 
```
docker stop popnode
docker rm popnode
```
4. Run a new container with the updated image (using the same command as above)
