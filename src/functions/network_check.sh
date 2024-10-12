#!/bin/bash

check_network_connectivity() {
    source "$(dirname "$0")/../utils/logger.sh"
    install_if_missing "ping"

    if ping -c 3 8.8.8.8 >/dev/null; then
        info "Network is working."
    else
        error "Network is down homie."
    fi
}