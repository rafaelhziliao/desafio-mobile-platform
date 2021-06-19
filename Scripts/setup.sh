#!/bin/bash

command_exists () {
    command -v "$1" &> /dev/null ;
}

install_brew_if_needed() {
    if command_exists brew
    then
        echo "✅  Homebrew is already installed"
    else
        echo "🚧 Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

install_rbenv_if_needed() {
    if command_exists rbenv
    then
        echo "✅  rbenv is already installed"
    else
        echo "🚧  Installing rbenv"
        brew install rbenv ruby-build
    fi
}

install_ruby_pinned_version_if_needed() {
    # Get the ruby version pinned in .ruby-version file localized at root of project
    RUBY_PINNED_VERSION=$(head -n 1 .ruby-version)
    echo "💎  ruby pinned version at the root of project: ${RUBY_PINNED_VERSION}"
    RBENV_RUBY_VERSION="$(rbenv version)"
    echo "📦  rbenv current ruby version: ${RBENV_RUBY_VERSION}"

    if [[ "$RBENV_RUBY_VERSION" =~ "${RUBY_PINNED_VERSION}" ]];
    then
        echo "✅  ruby ${RUBY_PINNED_VERSION} is already installed"
    else
        echo "🚧  Installing ruby ${RUBY_PINNED_VERSION}"
        rbenv install ${RUBY_PINNED_VERSION} && rbenv global ${RUBY_PINNED_VERSION}
    fi    
}

install_bundler_if_needed() {
    if command_exists bundle
    then
        echo "✅  bundler is already installed"
    else
        echo "🚧  Installing bundle"
        sudo gem install bundler
    fi
}

up_project() {
    ./Scripts/up.sh
}

install_brew_if_needed
install_rbenv_if_needed
install_ruby_pinned_version_if_needed
install_bundler_if_needed
up_project