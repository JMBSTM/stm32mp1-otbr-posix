#!/usr/bin/env bash
#  Copyright (C) 2025, STMicroelectronics - All Rights Reserved
#
# This script calls the original initialization script

set -euxo pipefail

echo "Generic initialization of OpenThread Border Router for the OpenSTLinux distribution"
/usr/libexec/otbr/script/setup "$@"

echo "Starting otbr-agent service"
systemctl start otbr-agent

echo "Starting otbr-web service"
systemctl start otbr-web

echo "Initialization completed!"
