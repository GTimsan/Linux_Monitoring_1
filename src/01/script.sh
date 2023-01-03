#!/bin/bash

if [[ "$1" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "parameter must not be a number" >&2
    exit;
fi
