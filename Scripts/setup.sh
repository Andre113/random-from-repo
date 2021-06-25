#!/bin/sh

# Jump to repository root
cd "$(git rev-parse --show-toplevel)"

# Install Ruby
rbenv init
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix openssl)/include"
CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)" RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)" rbenv install `cat .ruby-version`

# Install bundler dependencies
gem install bundler
bundle install

# Generate project
make generate

# Post setup info
echo "Run make run"
