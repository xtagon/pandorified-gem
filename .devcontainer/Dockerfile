FROM ruby:latest

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    sudo \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd --gid ${USER_GID} ${USERNAME} \
  && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
  && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
  && chmod 0440 /etc/sudoers.d/${USERNAME} \
  && mkdir -p /workspaces /usr/local/bundle \
    /home/${USERNAME}/.bundle /home/${USERNAME}/.bundle/bin /home/${USERNAME}/.gem \
  && chown -R ${USERNAME}:${USERNAME} /workspaces /usr/local/bundle \
    /home/${USERNAME}/.bundle /home/${USERNAME}/.bundle/bin /home/${USERNAME}/.gem

USER ${USERNAME}
WORKDIR /workspaces/pandorified-gem

ENV BUNDLE_RETRY=3 \
    BUNDLE_PATH=/home/${USERNAME}/.bundle \
    BUNDLE_APP_CONFIG=/home/${USERNAME}/.bundle \
    BUNDLE_BIN=/home/${USERNAME}/.bundle/bin \
    GEM_HOME=/home/${USERNAME}/.gem \
    PATH="${PATH}:/home/${USERNAME}/.bundle/bin"