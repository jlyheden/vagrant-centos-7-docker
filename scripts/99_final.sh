# clear yum
sudo yum clean all

# clear history
sudo rm /root/.bash_history
sudo rm /home/vagrant/.bash_history

# clear logs
sudo find /var/log -type f -delete

# clear swap
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
sudo swapoff $swappart
sudo dd if=/dev/zero of=$swappart
sudo mkswap -f $swappart
sudo swapon $swappart

# zero out disk
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo sync
sudo rm -f /EMPTY
sudo sync
