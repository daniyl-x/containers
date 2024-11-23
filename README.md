# Containers
*This repository contains YAML files for use with podman-compose
or docker-compose.*

All of these files may contain configuration, specific for my needs,
so you should use them as an example only.


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
    - [.env](#.env)
    - [service/](#service)
    - [stack/](#stack)
- [Credits](#credits)
- [License](#license)


## Installation
> **Warning:**
> compose-spec v2.20.0 compatibility is required to use compose files
> in the stack/ directory
> ([source](https://github.com/compose-spec/compose-spec/blob/main/spec.md#include)).

1. Ensure podman-compose or docker-compose are installed.
2. Clone this repo.


## Usage:
- [Podman](https://docs.podman.io/en/latest/markdown/podman-compose.1.html)
- [podman-compose](https://github.com/containers/podman-compose)
- [Docker & docker-compose](https://docs.docker.com/compose/)

### .env
This .env file defines the default values that are then used by all other
compose files. \
It includes some basic environment variables, bind volume prefix,
restart policy, as well as exposed ports for specific services, etc.

### service/
This directory contains single-service compose files.

### stack/
This directory contains multi-service compose files
and reuses single-service ones.


## Credits
- linuxserver.io for their images and documentation


## License
This project is licensed under the BSD Zero Clause License.
See the [LICENSE](LICENSE) file for details.

