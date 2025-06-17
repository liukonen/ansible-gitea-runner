FROM gitea/runner-images:ubuntu-22.04-slim-v25.04.01

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    ansible \
    openssh-client \
    rsync \
    git \
    curl \
    sudo \
    bash \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify ansible installation (optional)
RUN ansible --version

# Add your runner entrypoint or override if needed
# ENTRYPOINT ["/path/to/act-runner"]
