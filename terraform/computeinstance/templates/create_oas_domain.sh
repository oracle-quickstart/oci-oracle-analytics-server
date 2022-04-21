#!/usr/bin/env bash

touch /var/log/oas_create_domain.log
chmod 666 /var/log/oas_create_domain.log
chown oracle:oracle /var/log/oas_create_domain.log
sudo su oracle
sudo -u oracle bash /u01/app/Oracle/Middleware/Oracle_Home/bi/bin/config.sh -silent -responseFile /u01/data/biconfig.rsp -invPtrLoc /u01/app/oraInst.loc 2>&1 > /var/log/oas_create_domain.log
