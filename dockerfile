FROM gitea/runner-images:ubuntu-22.04-slim-v25.04.01

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ansible \
    openssh-client \
    rsync \
    git \
    curl \
    sudo \
    bash \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /usr/share/doc \
           /usr/share/man \
           /usr/share/info \
           /usr/share/lintian \
           /usr/share/locale \
           /tmp/* \
           /var/tmp/*
