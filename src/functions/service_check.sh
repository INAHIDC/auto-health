#!/bin/bash

check_services() {
    source "$(dirname "$0")/../utils/config.sh"
    source "$(dirname "$0")/../utils/logger.sh"

    for service in "${SERVICES[@]}"; do
        if systemctl is-active --quiet "$service"; then
            info "Service $service is running."
        else
            warn "Service $service is not running."
        fi
    done
}