#!/usr/bin/env bash

echo "> Executing command <"

bash -c "set -e; set -o pipefail; $1"
