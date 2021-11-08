#!/usr/bin/env bash

cat << EOF > /tmp/OASFirewallPortsFix.xml
<?xml version="1.0" encoding="utf-8"?>
<service>
    <short>OAS</short>
    <description>Oracle Analytics Server</description>
    <port protocol="tcp" port="9500-9508"/>
    <port protocol="tcp" port="7001"/>
    <port protocol="tcp" port="9704"/>
    <port protocol="tcp" port="9556"/>
</service>
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create OAS firewall xml config file. Exiting..."
fi

