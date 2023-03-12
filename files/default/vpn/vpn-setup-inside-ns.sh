#!/usr/bin/env bash

# Now, here's what we do in the namespace
#
# Bring up the interfaces:
ip link set lo up
ip link set veth-vpn up

# Set routable IP address:
ip addr add 192.168.0.254/24 dev veth-vpn

# Add default route
ip route add default via 192.168.0.1

# Start sshd
/usr/sbin/sshd

