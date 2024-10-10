#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
source "$script_dir/../src/utils/logger.sh"
source "$script_dir/../src/utils/config.sh"
source "$script_dir/../src/utils/install_helpers.sh"

for func in "$script_dir/../src/functions/"*.sh; do
    source "$func"
done

usage() {
    echo "Usage: troubleshooter.sh [options]"
    echo "Options:"
    echo "  -a, --all           Run all checks (default)"
    echo "  -d, --dns           Check DNS configuration"
    echo "  -r, --drivers       Check driver updates"
    echo "  -s, --storage       Check storage health"
    echo "  -n, --network       Check network connectivity"
    echo "  -v, --services      Check important services"
    echo "  -l, --system-load   Check system load"
    echo "  -h, --help          Display this help message"
}

run_all=true

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--dns) check_dns; run_all=false ;;
        -r|--drivers) check_drivers; run_all=false ;;
        -s|--storage) check_storage_health; run_all=false ;;
        -n|--network) check_network_connectivity; run_all=false ;;
        -v|--services) check_services; run_all=false ;;
        -l|--system-load) check_system_load; run_all=false ;;
        -a|--all) run_all=true ;;
        -h|--help) usage; exit 0 ;;
        *) echo "Unknown option: $1"; usage; exit 1 ;;
    esac
    shift
done

if [ "$run_all" = true ]; then
    check_dns
    check_drivers
    check_storage_health
    check_smart_status
    check_network_connectivity
    check_services
    check_system_load
fi
