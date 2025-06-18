FROM gitea/runner-images:ubuntu-22.04-slim-v25.04.01

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Base system update
RUN apt-get update

# Install base tools
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    rsync \
    sudo \
    openssh-client \
    bash \
    ca-certificates

# Install Ansible via pip (lighter than apt)
RUN pip install ansible

# Clean up apt artifacts to reduce image size
RUN apt-get purge -y --auto-remove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man /usr/share/info /usr/share/lintian /usr/share/locale
