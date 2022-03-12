# Source: https://medium.com/@piyushmittal.com/tensorflow-2-0-gpu-on-docker-container-with-ubuntu-20-04-lts-7eb8a30d2048
# 1.1. Verify You Have a CUDA-Capable GPU
lspci | grep -i nvidia

# 1.2 Verify supported linux distro
uname -m && cat /etc/*release

# Verify gcc installation exists
gcc --version

# 1.4. Verify the System has the Correct Kernel Headers and Development Packages Installed
# The version of the kernel your system is running can be found with:
uname -r

# 2. Install Nvidia Driver via Command Line
# 2.1: Search for Nvidia Drivers
apt search nvidia-driver

#2.2 Update the System Package Repository
# Before installing the driver, make sure to update the package repository. 
#Run the following commands:
sudo apt update
sudo apt upgrade

# install nvidia driver
sudo apt install nvidia-driver-470

# Reboot
sudo reboot

# Verify install
nvidia-smi


## Install Docker
# Install packages to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up stable repo
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# Install docker engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Verify we're good
sudo docker run hello-world
# sudo docker run -it ubuntu bash


# Build tensorflow image with CUDA + GPU Support with Dockerfile
NAME="dev/base"
TAG=":latest"
sudo docker build . -t $NAME$TAG