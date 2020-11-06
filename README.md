# Workbench

Development environment in a container.

Check out [Docker Hub](https://hub.docker.com/r/alexghiu/workbench) for available tags.

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/alexghiu/workbench.svg)](https://hub.docker.com/r/alexghiu/workbench)
[![Docker Pulls](https://img.shields.io/docker/pulls/alexghiu/workbench.svg)](https://hub.docker.com/r/alexghiu/workbench)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/alexghiu/workbench.svg?sort=semver)](https://hub.docker.com/r/alexghiu/workbench)

## Usage

```sh
docker container run
  --interactive  \
  --tty \
  --name workbench \
  \
  --mount type=bind,source="$HOME/projects",target="/projects" \
  \
  alexghiu/workbench:latest
```

## Includes

[vim-colors-xcode](https://github.com/arzg/vim-colors-xcode)

[vim-go](https://github.com/fatih/vim-go)

[dart-vim](https://github.com/dart-lang/dart-vim-plugin)

[delve](github.com/go-delve/delve)

