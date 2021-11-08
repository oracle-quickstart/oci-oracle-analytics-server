#!/usr/bin/env bash

cat << EOF > /tmp/create_oas_domain.sh
  sudo su opc
  sudo -u opc bash /oas/oas_install/Oracle/Middleware/Oracle_Home/bi/bin/config.sh -silent -responseFile /oas/oas_install/biconfig.rsp -invPtrLoc /oas/oas_install/oraInst.loc 2>&1 > /tmp/create_domain.log
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create create oas domain script. Exiting..."
fi

