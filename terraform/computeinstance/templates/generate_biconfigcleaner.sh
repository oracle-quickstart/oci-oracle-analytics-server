#!/usr/bin/env bash

cat << EOF > /tmp/biconfigcleaner.sh
  sudo  sed -i "s/PASSWORD=.*/PASSWORD=/g" /oas/oas_install/biconfig.rsp
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create create biconfig cleaner script. Exiting..."
fi