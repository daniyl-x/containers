# Containers
*This repository contains YAML files for use with podman-compose
or docker-compose.*

All of these files may contain configuration, specific for my needs,
so you should use them as an example only.


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
    - [base.yml](#base.yml)
- [Credits](#credits)
- [License](#license)


## Installation
1. Ensure podman-compose or docker-compose are installed
2. Clone this repo


## Usage:
- [Podman](https://docs.podman.io/en/latest/markdown/podman-compose.1.html)
- [podman-compose](https://github.com/containers/podman-compose)
- [Docker & docker-compose](https://docs.docker.com/compose/)

### base.yml
This file defines the base_service that is used by all other compose files. \
It's used to define default environment variables and restart policy.

To use it in a new compose file you should include the next block
in each service:
```yml
extends:
  file: ../base.yml
  service: base_service
```


## Credits
- linuxserver.io for their images and documentation


## License
This project is licensed under the BSD Zero Clause License.
See the [LICENSE](LICENSE) file for details.

