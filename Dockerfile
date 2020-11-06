FROM golang:1.15.3-alpine3.12
WORKDIR /workbench

RUN apk add \
    build-base \
    git \
    vim

COPY assets assets

# Fix colors
ENV TERM=xterm-256color

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
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go;
RUN vim -esN +GoInstallBinaries +q
RUN go get github.com/go-delve/delve/cmd/dlv;

# Flutter
RUN echo "- Flutter"; \
    git clone https://github.com/dart-lang/dart-vim-plugin.git ~/.vim/pack/plugins/start/dart-vim-plugin;

