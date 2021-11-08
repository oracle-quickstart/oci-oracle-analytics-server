#!/usr/bin/env bash

cat << EOF > /tmp/oas_installer.sh
echo "Skipping opening firewall ports and domain creation."
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create open OAS firewall ports script. Exiting..."
fi

