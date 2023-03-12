#
# Cookbook:: fedora_bootstrap
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Grab user data from data bag.
# Example file called "${data_bag_path}/users/user_info.json"
# { 'username':'steve',
#   'shell': '/bin/bash'
# }

name = data_bag_item('users', 'user_info')['username']

#
# Install .bashrc for me and root
user name do
  action :create
  home "/home/#{name}"
  manage_home true
end

cookbook_file "/home/#{name}/.bashrc" do
  source 'bashrc'
end

cookbook_file '/root/.bashrc' do
  source 'bashrc.root'
end

# Places to hold customizations
directory "/home/#{name}/.themes"
directory "/home/#{name}/.icons"

directory "/home/#{name}/.config"
directory "/home/#{name}/.config/procps"
cookbook_file "/home/#{name}/.config/procps/toprc" do
  source 'toprc'
end

# Install Java

# Configure JNLP as an application

# Install extensions for Gnome Shell
#
# dash-to-dock
#   https://github.com/micheleg/dash-to-dock
#   https://extensions.gnome.org/extension/307/dash-to-dock/
#
# clipboard indicator
#   https://extensions.gnome.org/extension/779/clipboard-indicator/
#
# CoverFlow alt-tab
#   https://extensions.gnome.org/extension/97/coverflow-alt-tab/
#
# Drop down terminal:
#   https://extensions.gnome.org/extension/442/drop-down-terminal/
#   https://github.com/zzrough/gs-extensions-drop-down-terminal/
#
# Notes
#   https://extensions.gnome.org/extension/1357/notes/
#   https://github.com/maoschanz/notes-extension-gnome
#
# Previously used extensions:
#
# Workspaces-to-dock
#   https://extensions.gnome.org/extension/427/workspaces-to-dock/
#   https://github.com/passingthru67/workspaces-to-dock
#
# TopIcons Plus
#   https://github.com/phocean/TopIcons-plus
#   Download zip file, unpack in tmp and run make
#
# System-monitor
#   https://extensions.gnome.org/extension/120/system-monitor/
#   https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet
#
# Hide Activities
#   This hides the Activities thing in the top-left corner
#   https://extensions.gnome.org/extension/744/hide-activities-button/
#
# pomodoro:
package 'gnome-shell-extension-pomodoro.x86_64'


# Install themes
#
# Gnome shell theme:
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
# Application theme:
# Vimix-gtk-themes

# https://github.com/vinceliuice/vimix-gtk-themes
#
# Install software packages
package 'nmap'
package 'brasero'
#package 'docker' #this should be docker-ce at least, but rather use podman anyway
package 'podman'
package 'buildah'
package 'skopeo'
#package 'redshift-gtk'
package 'libvirt'
package 'virt-manager'
package 'vim'
#package 'simple-mtpfs'
#package 'gvfs-mtp'
package 'meld'
package 'gconf-editor'
package 'dconf-editor'
package 'screenfetch'
package 'gnome-todo'
package 'libXScrnSaver'
package 'firewall-config'
package 'gnome-tweaks'
package 'liberation-fonts'
package 'redhat-lsb-core'
package 'libappindicator'
package 'libappindicator-gtk3'
package 'pygtk2'
package 'libgnome'
#package 'python2-gpg' # This doesn't work in F31
package 'keepass'
package 'cockpit'
package 'pcp'
package 'pcp-gui'
package 'pcp-system-tools'
package 'sysstat'
package 'dkms'
package 'htop'
package 'inkscape'
package 'gimp'
package 'gnote'
package 'foliate'

# dropbox, atom editor, gimp, Zim
# enable rpmfusion repos
# install gstreamer-plugins-ugly

# Ensure that /etc/systemd/logind.conf contains
# HandleLidSwitch=suspend explicitly (not commented)
# to get the lappy to suspend when lid is cloed.

#bash 'install_sublime_gpg_key' do
#  code 'rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg'
#end
bash 'install_sublime_repo' do
  code 'dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo'
  not_if  { ::File.exist?('/etc/yum.repos.d/sublime-text.repo') }
end
package 'sublime-text'

# Need a group called 'docker' with me in it
#group 'docker' do
#  append true
#  members name
#end

cookbook_file '/etc/yum.repos.d/google-chrome.repo' do
  source 'google-chrome.repo'
end

package 'google-chrome-stable'

group 'libvirt' do
  action :modify
  append true
  members name
end

# VPN Setup:
cookbook_file '/root/go-vpn.sh' do
  source 'vpn/go-vpn.sh'
  mode 0755
end
cookbook_file '/root/vpn-setup-inside-ns.sh' do
  source 'vpn/vpn-setup-inside-ns.sh'
  mode 0755
end
cookbook_file '/root/vpn-setup.sh' do
  source 'vpn/vpn-setup.sh'
  mode 0755
end
