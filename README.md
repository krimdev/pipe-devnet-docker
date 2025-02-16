# Pipe Network Node Docker

Docker configuration for running a Pipe Network Node.

## Prerequisites

- Docker and Docker Compose installed
- At least 4GB RAM
- At least 100GB free disk space
- Linux operating system

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/krimdev/pipe-devnet-docker
cd pipe-devnet-docker
```

2. Copy and edit the environment file:
```bash
cp .env.example .env
```

3. Configure your `.env` file with your settings:
```
# Required settings
SOLANA_WALLET=your_solana_wallet_address
RAM_SIZE=8
DISK_SIZE=100
CACHE_DIR=./data
```

4. Start the node:
```bash
docker-compose up -d
```

## Node Management Commands

Check node status:
```bash
docker-compose exec pipe-node ./pop --status
```

Generate a referral code:
```bash
docker-compose exec pipe-node ./pop --gen-referral-route
```

View node logs:
```bash
# All logs
docker-compose logs

# Follow logs in real time
docker-compose logs -f
```

Check if node is running:
```bash
docker-compose ps
```

Restart the node:
```bash
docker-compose restart
```

Stop the node:
```bash
docker-compose down
```

## Data Storage

Node data is stored in two locations:
- `CACHE_DIR` (default: ./data): Cache directory on your host machine
- Docker volume `node-config`: Node configuration files

## Configuration

### Environment Variables

- `SOLANA_WALLET`: Your Solana wallet address (required)
- `RAM_SIZE`: RAM allocation in GB (minimum 4GB)
- `DISK_SIZE`: Maximum disk usage in GB (recommended 200-500GB)
- `CACHE_DIR`: Local directory for cache storage


## Troubleshooting

1. Check node status:
```bash
docker-compose exec pipe-node ./pop --status
```

2. View detailed logs:
```bash
docker-compose logs -f
```

3. Check container resources:
```bash
docker stats pipe-node
```

## Resources

- [Pipe Network Documentation](https://pipe.network)
- [Dashboard](https://dashboard.pipenetwork.com)
- [Node Lookup](https://dashboard.pipenetwork.com/node-lookup)
