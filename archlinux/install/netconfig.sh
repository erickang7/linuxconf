ip link
vi /etc/systemd/network/50-wired.network

[Match]
Name=enp*

[Network]
DHCP=ipv4