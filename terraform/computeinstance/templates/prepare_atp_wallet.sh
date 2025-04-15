#!/usr/bin/env bash

cat << EOF > /u01/app/prep_atp_wallet.sh
    echo "Downloading the wallet file"
    curl -o /u01/app/wallet.zip $1 
    chown -R oracle:oracle /u01/app/wallet.zip
    echo "unzipping the wallet file"
    mkdir /u01/app/tmp_Wallet/
    sudo unzip /u01/app/wallet.zip -d /u01/app/tmp_Wallet/
    chown -R oracle:oracle /u01/app/tmp_Wallet
    sudo mv /u01/app/tmp_Wallet/* /u01/app/
    sudo rm -r /u01/app/tmp_Wallet/
    sudo rm  /u01/app/wallet.zip
EOF

if [[ $? -ne 0 ]]; then
    echo "Failed to create ATP wallet preparer file. Exiting..."
fi



