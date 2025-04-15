#!/usr/bin/env bash

cat << EOF > /u01/app/prep_atp_wallet.sh
   echo "No ATP wallet to prepare."
   echo $1
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create ATP wallet preparer file. Exiting..."
fi