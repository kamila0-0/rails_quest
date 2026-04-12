# Ruby 4 on Debian Bookworm slim
# If ruby:4 isn't yet on Docker Hub, switch to ruby:3.4-slim-bookworm
FROM ruby:4-slim-bookworm

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# --- System deps ---
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      git \
      curl \
      wget \
      less \
      vim \
      # SQLite
      libsqlite3-dev \
      sqlite3 \
      # For native gem extensions
      pkg-config \
      # yaml.h (psych gem), ssl, readline, zlib
      libyaml-dev \
      libssl-dev \
      libreadline-dev \
      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# --- Node.js 22 (LTS) via NodeSource — required by @tailwindcss/oxide (needs Node >= 20) ---
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

# --- Bundler & Rails ---
RUN gem update --system --no-document && \
    gem install bundler --no-document && \
    gem install rails --no-document

# --- Working directory ---
WORKDIR /workspace

# Persist gem cache between rebuilds
ENV BUNDLE_PATH=/usr/local/bundle
