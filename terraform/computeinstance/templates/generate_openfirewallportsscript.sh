#!/usr/bin/env bash

cat << EOF > /tmp/open_oas_firewall_ports.sh
sudo cp -f /tmp/OASFirewallPortsFix.xml  /etc/firewalld/services/
sudo firewall-offline-cmd --zone=public --add-service OASFirewallPortsFix
sudo /bin/systemctl restart firewalld.service
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create open OAS firewall ports script. Exiting..."
fi

