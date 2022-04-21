#!/usr/bin/env bash

echo "opening firewall ports"
sudo bash -c /u01/app/oas-scripts/open_oas_firewall_ports.sh
echo "execute domain creation"
bash -c /u01/app/oas-scripts/create_oas_domain.sh
bash -c /u01/app/oas-scripts/biconfigcleaner.sh 
