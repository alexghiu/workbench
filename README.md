# Workbench

Development environment in a container.

Check out [Docker Hub](https://hub.docker.com/r/alexghiu/workbench) for available tags.

[![Docker pulls](https://img.shields.io/docker/pulls/alexghiu/workbench.svg)]()
[![Docker build](https://img.shields.io/docker/build/alexghiu/workbench.svg)]()

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
