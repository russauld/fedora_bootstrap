#
# Cookbook:: fedora
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Install .bashrc for me and root
user 'rauld' do
  action :create
  home '/home/rauld'
  manage_home true
end

cookbook_file '/home/rauld/.bashrc' do
  source 'bashrc'
end

cookbook_file '/root/.bashrc' do
  source 'bashrc.root'
end

# Install Java

# Configure JNLP as an application

# Install extensions for Gnome Shell
#
# dash-to-dock
# https://github.com/micheleg/dash-to-dock
# https://extensions.gnome.org/extension/307/dash-to-dock/
#
# Previously I was using this but it's unsupported on Gnome shell v3.26 and up (F27)
# (It's just a basic fork of dash-to-dock anyway)
# 	simpledock
# 	https://extensions.gnome.org/extension/815/simple-dock/
# 	https://github.com/optimisme/gnome-shell-simple-dock
#
# Workspaces-to-dock - lately I don't like this one.
# https://extensions.gnome.org/extension/427/workspaces-to-dock/
# https://github.com/passingthru67/workspaces-to-dock
# 
# clipboard indicator
# https://extensions.gnome.org/extension/779/clipboard-indicator/
#
# CoverFlow alt-tab
# https://extensions.gnome.org/extension/97/coverflow-alt-tab/
#
# Drop down terminal:
# https://github.com/zzrough/gs-extensions-drop-down-terminal
#
# TopIcons Plus
# https://github.com/phocean/TopIcons-plus
# Download zip file, unpack in tmp and run make
#
# pomodoro:
package 'gnome-shell-extension-pomodoro.x86_64'


# Install themes
#
# Copernico theme:
# https://www.gnome-look.org/p/1013056/
# https://gitlab.com/mgyugcha/copernico-theme
#
#
# Install icon sets:
#
# Flat Remix:
# https://github.com/daniruiz/flat-remix
#
# Install software packages
# nmap, brasero, docker, redshift-gtk, virt-manager, libvirt, vim
package 'nmap'
package 'brasero'
package 'docker'
package 'redshift-gtk'
package 'libvirt'
package 'virt-manager'
package 'vim'
package 'simple-mtpfs'
package 'gvfs-mtp'
package 'meld'
package 'gconf-editor'
package 'dconf-editor'
package 'screenfetch'
package 'gnome-todo'
package 'libXScrnSaver'

# chrome, cockpit, 
# firewall
# dropbox, atom editor, gimp, Zim, gnome-tweak-tool, keepass
# enable rpmfusion repos
# install gstreamer-plugins-ugly

# Ensure that /etc/systemd/logind.conf contains
# HandleLidSwitch=suspend explicitly (not commented)
# to get the lappy to suspend when lid is cloed.
