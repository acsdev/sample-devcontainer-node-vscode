FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# dependencies
RUN apt upgrade && apt update && apt install -y curl

# non-root USER
USER vscode

ENV NODE_VERSION=20.18.0
ENV NVM_DIR=/home/vscode/.nvm
ENV PATH="${NVM_DIR}/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash \
&& . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
&& . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
&& . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
&& node --version \
&& npm --version