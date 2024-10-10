#!/bin/bash

check_dns() {
    source "$(dirname "$0")/../utils/config.sh"
    source "$(dirname "$0")/../utils/logger.sh"
    install_if_missing "grep"
    install_if_missing "awk"

    current_dns=$(grep "nameserver" /etc/resolv.conf | awk '{print $2}')

    for dns in "${EXPECTED_DNS[@]}"; do
        if ! echo "$current_dns" | grep -q "$dns"; then
            warn "DNS mismatch: Expected $dns not found in the current configuration."
        else
            info "DNS $dns is correctly configured."
        fi
    done
}
