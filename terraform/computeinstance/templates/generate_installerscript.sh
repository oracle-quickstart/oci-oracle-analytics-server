#!/usr/bin/env bash

cat << EOF > /tmp/oas_installer.sh
  echo "opening firewall ports"
  sudo bash /tmp/open_oas_firewall_ports.sh
  echo "execute domain creation"
  bash /tmp/create_oas_domain.sh
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create oas installer script. Exiting..."
fi

