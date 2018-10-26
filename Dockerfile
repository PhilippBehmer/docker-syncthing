FROM ubuntu:16.04
LABEL maintainer "Philipp Behmer - https://github.com/PhilippBehmer"

ENV SYNCTHING_VERSION=0.14.51
ENV SYNCTHING_UID=1000

WORKDIR /opt

# System update
RUN apt-get update \
  && apt-get upgrade -y --no-install-recommends \
  && apt-get install wget -y \
  && apt-get autoremove -y \
  && apt-get clean

# Add Syncthing user
RUN adduser --system --uid $SYNCTHING_UID syncthing

# Download Syncthing from GitHub
RUN wget https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/syncthing-linux-amd64-v${SYNCTHING_VERSION}.tar.gz -O ./syncthing.tar.gz --quiet \
  && tar -xzvf syncthing.tar.gz syncthing-linux-amd64-v${SYNCTHING_VERSION}/syncthing \
  && rm -f syncthing.tar.gz \
  && mv syncthing-linux-amd64-v${SYNCTHING_VERSION} syncthing

WORKDIR /opt/syncthing

USER syncthing

ENTRYPOINT ["/opt/syncthing/syncthing"]
