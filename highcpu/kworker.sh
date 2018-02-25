#!/bin/bash

grep . -r /sys/firmware/acpi/interrupts/ | grep gpe6f

sudo cp disable-gpe6f.service /etc/systemd/systemd

sudo systemctl enable disable-gpe6f
sudo systemctl disable disable-gpe6f

sudo dmesg

