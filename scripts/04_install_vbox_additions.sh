# install deps
sudo yum install -y \
  kernel-devel \
  gcc

# Mount the disk image
cd /tmp
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop $HOME/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
sudo /tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
sudo umount isomount
sudo rm -rf isomount $HOME/VBoxGuestAdditions.iso
sudo yum remove -y \
  kernel-devel \
  gcc \
  cpp \
  glibc-devel \
  glibc-headers \
  kernel-headers
