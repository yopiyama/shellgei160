FROM ubuntu:latest

ARG USERNAME=user

RUN useradd -m user
# sudo は使わないはずなのでパスワード等は不要
# RUN echo "user:password" | chpasswd

ENV PATH /usr/local/bin:$PATH

RUN apt update

RUN apt install -y zsh vim exa bat ripgrep fd-find hexyl \
    bc man gawk imagemagick rename jq

RUN zsh
ENV SHELL /usr/bin/zsh

COPY ./qdata /home/$USERNAME/qdata
COPY ./answer /home/$USERNAME/answer

USER $USERNAME
WORKDIR /home/$USERNAME/

