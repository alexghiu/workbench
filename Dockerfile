FROM ubuntu:bionic
WORKDIR /workbench
RUN apt-get update && apt-get install -y wget git vim
COPY assets assets
RUN cat assets/bashrc >> ~/.bashrc; \
    cp assets/vimrc ~/.vimrc; \
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell; \
    git clone git://github.com/chriskempson/base16-vim.git base16; \
    mkdir -p ~/.vim/colors; \
    cp base16/colors/*.vim ~/.vim/colors; \
    rm -rf assets; \
    rm -rf base16;
RUN set -eux; \
    go_version=1.14.4; \
    go_os=linux; \
    go_arch=amd64; \
    go_out=go.tgz; \
    wget https://dl.google.com/go/go${go_version}.${go_os}-${go_arch}.tar.gz -O $go_out; \
    tar -C /usr/local -xzf $go_out; \
    rm $go_out; \
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
