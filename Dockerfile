FROM ubuntu
RUN apt update 
RUN apt install -y git
RUN apt install -y clang
RUN apt install -y cmake
RUN apt install -y build-essential
RUN apt install -y librocksdb-dev=6.11.4-3
RUN apt install -y curl

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo --help
RUN git clone -b v0.9.9 https://github.com/romanz/electrs --single-branch
RUN cd electrs
RUN ROCKSDB_INCLUDE_DIR=/usr/include ROCKSDB_LIB_DIR=/usr/lib cargo build --locked --release --manifest-path /electrs/Cargo.toml

