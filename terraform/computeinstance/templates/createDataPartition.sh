
#!/usr/bin/env bash

echo "sgdisk ... "
sgdisk -e /dev/sda

# create partition for remaining unallocated
echo "Creating partitions... "
avl_free_space_info="$( sudo parted /dev/sda unit MiB print free | grep 'Free Space' | tail -n1 )"
partition_start=$( echo ${avl_free_space_info} | awk '{print $1}' | tr -dc '0-9' )
echo "First partition start : $partition_start"

end_no=$( echo ${avl_free_space_info} | awk '{print $2}' | tr -dc '0-9' )
parted -s -a optimal /dev/sda mkpart primary ${partition_start}MiB 100%
lsblk

# Create physical volume
echo "creating physical volume /dev/sda5"
pvcreate -f /dev/sda5

# Create volume group - vg_app or vg_data
echo "creating volume group vg_data"
vgcreate vg_data /dev/sda5

# Create logical volume - vg_app-lv_app
echo "Creating logical volume : vg_data-lv_data"

lvcreate -y -q -l 100%FREE  -n vg_data-lv_data vg_data 

# Create filesystem for logical volumes
filesystem_path="/dev/vg_data/vg_data-lv_data"

echo "Creating filesystem : $filesystem_path"
mkfs.ext4 $filesystem_path

echo "Creating dir : /u01/data "
mkdir -p /u01/data
# Mount the directory
echo "mounting the dir : /u01/data"
mount $filesystem_path /u01/data

echo "changing the permissions for /u01/data"
chown -R oracle:oracle /u01/data
chmod 755 /u01/data

echo "creating data/domains folder"
mkdir -p /u01/data/domains
chown -R oracle:oracle /u01/data/domains

lsblk

echo ""

ls -l /u01

# Add fstab entry
cp /etc/fstab /etc/fstab."\$( date +'%Y%m%d%H%M%S' )"
cp /etc/fstab .

chmod 777 fstab
echo -e "/dev/vg_data/vg_data-lv_data /u01/data   ext4    defaults,noatime,nodiratime,nodev,_netdev 0 2" >> fstab

cp fstab /etc/fstab
rm -f fstab
