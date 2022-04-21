#!/usr/bin/env bash

echo "[OAS_MP] Ensure Firewall enabled and is active start"
echo "[OAS_MP] firewalld status :"
sudo systemctl status firewalld
if systemctl list-unit-files | grep -E "firewalld.service.*disabled"; then 
   sudo systemctl enable firewalld
   sudo systemctl restart firewalld
fi
echo "[OAS_MP] Ensure Firewall enabled and is active finish"
echo "[OAS_MP] Open ports in Firewall start"
sudo cp -f /u01/app/oas-scripts/DefaultSingleNodeOASFirewallPorts.xml  /etc/firewalld/services/
sudo firewall-offline-cmd --zone=public --add-service DefaultSingleNodeOASFirewallPorts
sudo systemctl restart firewalld
echo "[OAS_MP] Open ports in Firewall finish"
