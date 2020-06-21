FROM ubuntu:bionic
WORKDIR /workbench
RUN apt-get -qqy update && apt-get install -qqy wget git vim zip openjdk-8-jdk
COPY assets assets

# Base16 for Shell and VIM
RUN echo "- Base16"; \
    cat assets/bashrc >> ~/.bashrc; \
    cp assets/vimrc ~/.vimrc; \
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell; \
    git clone git://github.com/chriskempson/base16-vim.git base16; \
    mkdir -p ~/.vim/colors; \
    cp base16/colors/*.vim ~/.vim/colors; \
    rm -rf assets; \
    rm -rf base16;

# Go
RUN echo "- Go"; \
    go_version=1.14.4; \
    go_os=linux; \
    go_arch=amd64; \
    go_out=go.tgz; \
    wget -q https://dl.google.com/go/go${go_version}.${go_os}-${go_arch}.tar.gz -O $go_out; \
    tar -C /usr/local -xzf $go_out; \
    rm $go_out; \
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Flutter
#
# To be able to correctly install the android-command-line-tools I used:
# https://stackoverflow.com/questions/60440509/android-command-line-tools-sdkmanager-always-shows-warning-could-not-create-se
RUN echo "- Flutter"; \
    android_sdk_version=6514223; \
    android_sdk_out=androidsdk.zip; \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-${android_sdk_version}_latest.zip -O $android_sdk_out; \
    mkdir -p /usr/local/android; \
    unzip -d /usr/local/android/cmdline-tools $android_sdk_out; \
    export PATH="/usr/local/android/cmdline-tools/tools/bin:$PATH"; \
    yes | sdkmanager --licenses && \
    sdkmanager --update && \
    sdkmanager "emulator" \
      "platform-tools" \
      "platforms;android-30" \
      "build-tools;30.0.0" \
      "system-images;android-26;default;x86" && \
    echo "no" | avdmanager create avd --name "android26" --package "system-images;android-26;default;x86"; \
    \
    flutter_version=1.17.3; \
    flutter_out=flutter.txz; \
    wget -q https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${flutter_version}-stable.tar.xz -O $flutter_out; \
    tar -C /usr/local -xf $flutter_out;
ENV ANDROID_HOME /usr/local/android
ENV PATH /usr/local/flutter/bin:/usr/local/android/cmdline-tools/tools/bin:$PATH

