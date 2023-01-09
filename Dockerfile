FROM debian:11.6-slim as base

# use bash inside running container
ENV SHELL=/bin/bash
# use bash while building container
SHELL ["/bin/bash", "-c"]

# create non-root user
ENV NON_ROOT_USER=user
ENV NON_ROOT_USER_HOME=/home/user
ENV NON_ROOT_USER_UID=1000
ENV NON_ROOT_USER_GID=$NON_ROOT_USER_UID
RUN groupadd --gid $NON_ROOT_USER_GID $NON_ROOT_USER && \
    useradd --uid $NON_ROOT_USER_UID --gid $NON_ROOT_USER_GID --create-home $NON_ROOT_USER

# common tools
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    xz-utils \
    gnupg \
    lsb-release \
    bash-completion

# git
RUN apt-get install -y --no-install-recommends git && \
    git config --global pull.rebase true && \
    git config --global rebase.autoStash true

# docker
# renovate: source=github-tags name=docker/cli versioning=semver
ENV DOCKER_VERSION=20.10.22
# renovate: source=github-tags name=docker/compose versioning=semver
ENV DOCKER_COMPOSE_VERSION=2.14.1
COPY packages/install-tool/docker.sh /usr/lib/install-tool/docker.sh
RUN /usr/lib/install-tool/docker.sh

# github-cli
# renovate: source=github-tags name=cli/cli versioning=semver
ENV GITHUB_CLI_VERSION=2.21.2
COPY packages/install-tool/github-cli.sh /usr/lib/install-tool/github-cli.sh
RUN /usr/lib/install-tool/github-cli.sh

# node
# renovate: source=github-tags name=nodejs/node versioning=semver
ENV NODE_VERSION=18.13.0
COPY packages/install-tool/node.sh /usr/lib/install-tool/node.sh
RUN /usr/lib/install-tool/node.sh

# gcloud
# renovate: source=docker name=google/cloud-sdk versioning=docker
ENV GCLOUD_VERSION=410.0.0
COPY packages/install-tool/gcloud.sh /usr/lib/install-tool/gcloud.sh
RUN /usr/lib/install-tool/gcloud.sh

# cleanup
RUN apt-get autoremove -y && \
    apt-get clean -y && \
    cd /tmp && rm -rf *

# install-tool
COPY packages/install-tool /usr/lib/install-tool
RUN ln -s /usr/lib/install-tool/install-tool /usr/bin/install-tool

FROM base as devcontainer
