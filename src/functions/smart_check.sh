#!/bin/bash

check_smart_status() {
    source "$(dirname "$0")/../utils/logger.sh"
    install_if_missing "smartctl"

    for disk in /dev/sd?; do
        status=$(sudo smartctl -H "$disk" | grep -i "SMART overall-health self-assessment test result" | awk -F: '{print $2}')
        if [[ "$status" =~ "PASSED" ]]; then
            info "Disk $disk SMART status: $status"
        else
            warn "Disk $disk SMART status: $status"
        fi
    done
}