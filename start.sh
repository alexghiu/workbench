#!/bin/bash

docker container run --interactive --detach --privileged \
  --name workbench \
  \
  --env "DISPLAY" \
  --net host \
  --mount type=bind,source="$HOME/.Xauthority",target="/root/.Xauthority" \
  --mount type=bind,source="/dev/kvm",target="/dev/kvm" \
  \
  --mount type=bind,source="$HOME/Work/learn",target="/learn" \
  \
  alexghiu/workbench:latest
