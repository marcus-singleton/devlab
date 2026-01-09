FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# 1) Core system & networking tools, VCS, runtimes, editor/UX, config management
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        \
        # Core system & networking
        ca-certificates \
        curl \
        wget \
        dnsutils \
        iproute2 \
        net-tools \
        zip \
        unzip \
        htop \
        jq \
        less \
        tree \
        tcpdump \
        \
        # Version control
        git \
        \
        # Runtimes / languages
        python3 \
        python3-pip \
        golang-go \
        \
        ##### Editor & CLI UX
        neovim \
        ripgrep \
        fd-find \
        fzf \
        tmux \
        \
        # Configuration management
        ansible \
    && rm -rf /var/lib/apt/lists/*

# 2) AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "/tmp/awscliv2.zip" && \
    cd /tmp && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip

# 3) Terraform (change version as needed)
ENV TF_VERSION=1.9.5
RUN curl -fsSL "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_$(dpkg --print-architecture).zip" \
        -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin && \
    rm /tmp/terraform.zip

# 4) kubectl (latest stable)
RUN curl -fsSL "https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/$(dpkg --print-architecture)/kubectl" \
        -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# 5) helm (change version as needed)
ENV HELM_VERSION=v3.16.1
RUN curl -fsSL "https://get.helm.sh/helm-${HELM_VERSION}-linux-$(dpkg --print-architecture).tar.gz" \
        -o /tmp/helm.tgz && \
    tar -xzf /tmp/helm.tgz -C /tmp && \
    mv /tmp/linux-*/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    rm -rf /tmp/helm.tgz /tmp/linux-*

# 6) k3d (k3s in Docker) for local Kubernetes clusters
RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Add 1Password CLI apt repo and install op (Debian/Ubuntu)
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc \
        | gpg --dearmor \
        | tee /usr/share/keyrings/1password-archive-keyring.gpg >/dev/null && \
    sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] \
        https://downloads.1password.com/linux/debian/amd64 stable main" \
        > /etc/apt/sources.list.d/1password-cli.list' && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends 1password-cli && \
    rm -rf /var/lib/apt/lists/*

RUN echo "Infra DevPod base with grouped core tools + AWS CLI, Terraform, kubectl, helm"

