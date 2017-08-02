# remove any old docker if available
sudo yum remove -y \
  docker \
  docker-common \
  docker-selinux \
  docker-engine

# install some required tools for adding the docker ce repo
sudo yum install -y \
  yum-utils \
  device-mapper-persistent-data \
  lvm2

# add docker ce repo
sudo yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

# install docker
sudo yum makecache fast
sudo yum install -y docker-ce

# enable it in lennartd
sudo systemctl enable docker

# add vagrant user to docker group
sudo usermod -a -G docker vagrant
