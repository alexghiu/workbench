FROM ubuntu:bionic
WORKDIR /workbench
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    git \
    vim \
    zip \
    openjdk-8-jdk;
COPY assets assets

# Xresources
RUN echo "- Xresources"; \
  cat assets/xresources >> ~/.Xresources;

# VIM Xcode colors
RUN echo "- VIM Xcode"; \
    cp assets/vimrc ~/.vimrc; \
    mkdir -p ~/.vim; \
    git clone https://github.com/arzg/vim-colors-xcode.git; \
    cp -r vim-colors-xcode/autoload ~/.vim; \
    cp -r vim-colors-xcode/colors ~/.vim; \
    cp -r vim-colors-xcode/doc ~/.vim; \
    rm -rf vim-colors-xcode;

# Go
RUN echo "- Go"; \
    go_version=1.15.2; \
    go_os=linux; \
    go_arch=amd64; \
    go_out=go.tgz; \
    wget -q https://dl.google.com/go/go${go_version}.${go_os}-${go_arch}.tar.gz -O $go_out; \
    tar -C /usr/local -xzf $go_out; \
    rm $go_out; \
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go;
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN go get github.com/go-delve/delve/cmd/dlv;

# NodeJS
RUN echo "- NodeJS"; \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash; \
    . ~/.bashrc; \
    nvm install --lts;

# Android
#
# To be able to correctly install the android-command-line-tools I used:
# https://stackoverflow.com/questions/60440509/android-command-line-tools-sdkmanager-always-shows-warning-could-not-create-se
RUN echo "- Android"; \
    android_sdk_version=6609375; \
    android_sdk_out=androidsdk.zip; \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-${android_sdk_version}_latest.zip -O $android_sdk_out; \
    mkdir -p /usr/local/android; \
    unzip -d /usr/local/android/cmdline-tools $android_sdk_out; \
    rm  $android_sdk_out; \
    export PATH="/usr/local/android/cmdline-tools/tools/bin:$PATH"; \
    yes | sdkmanager --licenses && \
    sdkmanager --update && \
    sdkmanager "emulator" \
      "platform-tools" \
      "platforms;android-30" \
      "build-tools;30.0.0" \
      "system-images;android-26;google_apis;x86" && \
    echo "no" | avdmanager create avd --name "android26" --package "system-images;android-26;google_apis;x86";
ENV ANDROID_HOME /usr/local/android
ENV PATH /usr/local/android/cmdline-tools/tools/bin:/usr/local/android/platform-tools:$PATH

# Flutter
RUN echo "- Flutter"; \
    flutter_version=1.17.5; \
    flutter_out=flutter.txz; \
    wget -q https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${flutter_version}-stable.tar.xz -O $flutter_out; \
    tar -C /usr/local -xf $flutter_out; \
    rm $flutter_out; \
    git clone https://github.com/dart-lang/dart-vim-plugin.git ~/.vim/pack/plugins/start/dart-vim-plugin;
ENV PATH /usr/local/flutter/bin:/usr/local/flutter/.pub-cache/bin:$PATH

RUN echo "- Flutter web"; \
    flutter channel beta; \
    flutter upgrade; \
    flutter config --enable-web;

RUN echo "- Flutter DevTools"; \
    flutter pub global activate devtools;
