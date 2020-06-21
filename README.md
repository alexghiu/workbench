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

# Bootstrap Flutter & Android Studio

Start the container:

```sh
./start.sh
```

Get a shell in the container:

```sh
# Get the container id
docker container ls -a

docker container exec -it [container-id] /bin/bash
```

Inside the container:

```sh
# Get an initial status of flutter dependencies
flutter doctor

# Accept Android Licenses
flutter doctor --android-licenses

# Setup Android Studio
studio.sh

# When Android Studio starts:
# 1. Do the initial "standard setup"
# 2. Intall "Flutter" (will also install "Dart") plugins
# 3. Configure an AVD Manager
#    Personal "Recommended" config
#       Device: Pixel 2
#       System image:
#          Release: "Oreo"
#          API Level: 26
#          Target: Android 8.0

# Check that AVD against Flutter:
flutter emulators
# The output should contain the freshly configured AVD.

# Start the emulator:
flutter emulators --launch Pixel_2_API_26

# Check that the emulated device against Flutter:
flutter devices
# List should contain the running emulated device.

# Run the app in the emulator
cd [app path in container]
flutter run --enable-software-rendering
```

## Includes

[Base16](https://github.com/chriskempson/base16)

[Go](https://golang.org)

[vim-go](https://github.com/fatih/vim-go)

[Flutter](https://flutter.dev)


