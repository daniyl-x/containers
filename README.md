# Containers
*This repository contains container-related files like compose files
for use with podman-compose or docker-compose,
container-specific configurations, etc.*

All of these files may contain configuration, specific for my needs,
so you should use them as an example only.


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
    - [The friendly manual](#the-friendly-manual)
    - [File structure](#file-structure)
    - [Environment variables](#environment-variables)
    - [Running containers](#running-containers)
    - [Starting Podman containers on boot](#starting-podman-containers-on-boot)
- [Credits](#credits)
- [License](#license)


## Installation
1. Ensure podman-compose or docker-compose are installed.
2. Clone this repo.


## Usage:
### The friendly manual
- [Podman](https://docs.podman.io/en/latest/markdown/podman-compose.1.html)
- [podman-compose](https://github.com/containers/podman-compose)
- [Docker & docker-compose](https://docs.docker.com/compose/)

### File structure
Each directory in the root of this repository corresponds to one containerized
service and follows the next structure:
```
container-name/
├── compose.yml
└── config/
    ├── some_config.conf
    └── another_config.conf
```
Where `compose.yml` is [compose file](#the-friendly-manual), and `config/`
directory is used for configuration files or directories, mounted to this
container.

### Environment variables
In the root of this repository there is a file `.env` which is intentionally
left there.\
This file is used to define some highly reusable variables like PUID, PGID, TZ,
etc., which are then inserted in `compose.yml` files.

With podman-compose you can expect that `.env` will be read from your current
directory, but docker compose may require to source it first:
```sh
. .env
```

### Running containers
It is recommended to run containers from this repository, passing required
`compose.yml` file to [podman-compose or docker-compose](#the-friendly-manual)
(`-f container-name/compose.yml`).

### Starting Podman containers on boot
Podman containers can be converted to systemd services.\
To do this, you need to:

1. Create a container with Podman/podman-compose.
2. Use [provided script](podman-to-systemd.sh) to generate, move to correct
place, and enable systemd service.

Example:
```sh
# Create two containers from compose files
podman-compose -f homepage/compose.yml up -d
podman-compose -f jellyfin/compose.yml up -d

# Use script to handle systemd service generation and config
./podman-to-systemd.sh homepage jellyfin
```


## Credits
- linuxserver.io for their images and documentation


## License
This project is licensed under the BSD Zero Clause License.
See the [LICENSE](LICENSE) file for details.

