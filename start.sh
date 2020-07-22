#!/bin/bash

docker container run --interactive --detach --privileged \
  --name workbench \
  \
  --env "DISPLAY" \
  --net host \
  --mount type=bind,source="$HOME/.Xauthority",target="/root/.Xauthority" \
  --mount type=bind,source="/dev/kvm",target="/dev/kvm" \
  \
  --mount type=bind,source="$PLAYGROUND",target="/playground" \
  --mount type=bind,source="$SAMPLES",target="/samples" \
  \
  alexghiu/workbench:latest
