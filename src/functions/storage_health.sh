#!/bin/bash

check_storage_health() {
    source "$(dirname "$0")/../utils/config.sh"
    source "$(dirname "$0")/../utils/logger.sh"
    install_if_missing "df"

    df -h | awk -v threshold="$DISK_USAGE_THRESHOLD" 'NR>1{if ($5+0 > threshold) print "Warning: Partition "$1" is "$5" full."}'
}