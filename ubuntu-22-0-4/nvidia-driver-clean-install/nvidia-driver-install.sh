# TODO: FIXME: XXX: HACK: NOTE: INTENT: USAGE:

# NOTE: from https://www.linuxcapable.com/install-nvidia-drivers-on-ubuntu-linux/

sudo apt update
sudo apt upgrade

lspci | grep -e VGA
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
# sudo apt install nvidia-driver-535 for installing 535 version.

sudo reboot