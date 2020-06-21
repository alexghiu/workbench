# Workbench

Development environment in a container.

Check out [Docker Hub](https://hub.docker.com/r/alexghiu/workbench) for available tags.

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/alexghiu/workbench.svg)](https://hub.docker.com/r/alexghiu/workbench)
[![Docker Pulls](https://img.shields.io/docker/pulls/alexghiu/workbench.svg)](https://hub.docker.com/r/alexghiu/workbench)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/alexghiu/workbench.svg?sort=semver)](https://hub.docker.com/r/alexghiu/workbench)

## Usage

General

```sh
# Start container
./start.sh

# Get the container id
docker container ls -a

# Get container shell
docker container exec -it [container-id] /bin/bash
```

To change the color scheme, type `base16` followed by TAB. This will display the available options:

```sh
base16_3024
base16_apathy
...
base16_zenburn
```

Flutter

```sh
# Check available emulators (android26):
flutter emulators

# Start the emulator:
flutter emulators --launch android26

# List devices (including emulator):
flutter devices

# Run the app in the emulator
cd [app path in container]
flutter run --enable-software-rendering
```

## Includes

[Base16](https://github.com/chriskempson/base16)

[Go](https://golang.org)

[vim-go](https://github.com/fatih/vim-go)

[Flutter](https://flutter.dev)


