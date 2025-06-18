FROM gitea/runner-images:ubuntu-22.04-slim-v25.04.01

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    git \
    curl \
    rsync \
    sudo \
    openssh-client \
    bash \
    ca-certificates \
    build-essential

# Install Ansible using pip (in its own step for easier debugging)
RUN pip install ansible

# Clean up unnecessary build tools and docs
RUN apt-get purge -y build-essential python3-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man /usr/share/info /usr/share/lintian /usr/share/locale
