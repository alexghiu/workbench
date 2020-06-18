# Workbench

Development environment in a container.

Check out [Docker Hub](https://hub.docker.com/r/alexghiu/workbench) for available tags.

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/alexghiu/workbench.svg)](https://hub.docker.com/r/alexghiu/workbench)
[![Docker Pulls](https://img.shields.io/docker/pulls/alexghiu/workbench.svg)](https://hub.docker.com/r/alexghiu/workbench)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/alexghiu/workbench.svg?sort=semver)](https://hub.docker.com/r/alexghiu/workbench)

## Usage

```sh
docker run -it --name workbench alexghiu/workbench:latest /bin/bash
```

To change the color scheme, type `base16` followed by TAB. This will display the available options:

```sh
base16_3024
base16_apathy
...
base16_zenburn
```

## Dependencies

[Base16](https://github.com/chriskempson/base16)

[vim-go](https://github.com/fatih/vim-go)
