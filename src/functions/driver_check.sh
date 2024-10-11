#!/bin/bash

check_drivers() {
    source "$(dirname "$0")/../utils/install_helpers.sh"
    source "$(dirname "$0")/../utils/logger.sh"

    if [ -f /etc/debian_version ]; then
        install_if_missing "apt"
        sudo apt-get update
        upgradable=$(apt list --upgradable 2>/dev/null | grep -i "driver")
    elif [ -f /etc/redhat-release ]; then
        install_if_missing "yum"
        sudo yum check-update
        upgradable=$(yum list updates 2>/dev/null | grep -i "driver")
    else
        error "Unsupported OS for driver check."
        return 1
    fi

    if [ -z "$upgradable" ]; then
        info "All drivers are up to date."
    else
        warn "The following drivers are out of date:"
        echo "$upgradable"
    fi
}