FROM gitea/runner-images:ubuntu-22.04-slim-v25.04.01

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Install dependencies in one layer & cleanup aggressively
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 python3-pip python3-venv \
        git \
        curl \
        rsync \
        sudo \
        openssh-client \
        bash \
        ca-certificates && \
    # Install Ansible via pip (much smaller than apt)
    pip install ansible && \
    # Cleanup to shrink image
    apt-get purge -y --auto-remove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc /usr/share/man /usr/share/info /usr/share/lintian /usr/share/locale
