#!/bin/bash

install_if_missing() {
    package="$1"
    if ! command -v "$package" >/dev/null 2>&1; then
        echo "$package is not installed. Installing..."
        if [ -f /etc/debian_version ]; then
            sudo apt-get update && sudo apt-get install -y "$package"
        elif [ -f /etc/redhat-release ]; then
            sudo yum install -y "$package"
        elif [ "$(uname)" == "Darwin" ]; then
            brew install "$package"
        else
            echo "Unsupported OS. Please install $package manually."
            return 1
        fi
    fi
}