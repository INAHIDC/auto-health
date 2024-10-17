#!/bin/bash

install_if_missing() {
    package="$1"
    if ! command -v "$package" &>/dev/null; then
        echo "$package is not installed. Installing..."
        case "$(uname)" in
            Linux)
                if [ -f /etc/debian_version ]; then
                    sudo apt-get update -qq && sudo apt-get install -y "$package"
                elif [ -f /etc/redhat-release ]; then
                    sudo yum install -y "$package"
                else
                    echo "Unsupported Linux distribution. Please install $package manually."
                    return 1
                fi
                ;;
            Darwin)
                brew install "$package"
                ;;
            *)
                echo "Unsupported OS. Please install $package manually."
                return 1
                ;;
        esac
    fi
}
