#!/usr/bin/env bash

# Ensure that /etc/netns/resolv.conf exists on the host
# This will be the file used in the namespace.
# nameserver 1.1.1.1
# nameserver 8.8.8.8

# Assume that we are operating on an OS with a bridge interface already configured
br='br0'

# Create network namespace
ip netns add vpn

# Create veth pair, add one end to the namespace we just created:
ip link add name veth-local type veth peer name veth-vpn netns vpn

# Bring up the link:
ip link set veth-local up

# Add it to the bridge
brctl addif $br veth-local

# it takes a few seconds to get the plumbing all hooked up ...
echo "sleeping 5 ..."
sleep 5

# Run the setup script in the namespace
ip netns exec vpn /bin/bash /root/vpn-setup-inside-ns.sh

