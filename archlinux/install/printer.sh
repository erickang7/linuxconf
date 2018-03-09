#!/bin/bash

sudo pacman -S cups

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

# sudo systemctl enable org.cups.cupsd.socket
# sudo systemctl disable org.cups.cupsd.socket
# sudo systemctl start org.cups.cupsd.socket

sudo systemctl status org.cups.cupsd
# sudo systemctl status org.cups.cupsd.socket