#!/usr/bin/env bats

load '../src/utils/logger.sh'
load '../src/functions/driver_check.sh'

@test "check_drivers function should run without errors" {
    run check_drivers
    [ "$status" -eq 0 ]
}