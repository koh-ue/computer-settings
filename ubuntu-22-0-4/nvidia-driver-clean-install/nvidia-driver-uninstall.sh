# TODO: FIXME: XXX: HACK: NOTE: INTENT: USAGE:

# NOTE: from https://linuxhint.com/clean-install-nvidia-drivers-ubuntu-22-04-lts/

# INTENT: Some commands will work only in bash.
bash
sudo apt update
sudo apt upgrade

sudo apt remove --purge nvidia-*
sudo apt autoremove --purge
sudo apt clean
sudo reboot