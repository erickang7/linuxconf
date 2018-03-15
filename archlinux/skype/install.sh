#!/bin/sh

sudo pacman -Sy pidgin pidgin-sipe purple-skypeweb purple-plugin-pack
pidgin-libnotify guifications

sudo cp pidgin-suspend.conf /etc/systemd/
