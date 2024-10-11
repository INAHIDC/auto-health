#!/usr/bin/env bats

load '../src/utils/logger.sh'
load '../src/functions/dns_check.sh'

@test "check_dns function should detect correct DNS" {
    EXPECTED_DNS=("8.8.8.8")
    run check_dns
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"DNS 8.8.8.8 is correctly configured."* ]]
}