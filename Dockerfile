FROM maddinat0r/centos-samp:latest

RUN sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y

RUN cp $HOME/.cargo/bin/* /usr/bin/

RUN rustup install stable-i686-unknown-linux-gnu

WORKDIR /pawn-env

COPY . .

ENTRYPOINT [ "make", "build" ]
