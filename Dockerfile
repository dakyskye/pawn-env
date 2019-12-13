FROM rust:latest

WORKDIR /pawn-env

COPY . .

RUN apt update; apt install -y gcc-multilib

RUN rustup install stable-i686-unknown-linux-gnu

ENTRYPOINT [ "make", "build" ]
