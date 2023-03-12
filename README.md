# Fedora Workstation Bootstrap

This cookbook configures a Fedora Workstation the way Russ likes it.
It installs packages and gets it all configured.

Feel free to copy and modify as you like.

* Install Chef Infra Client from [here](https://downloads.chef.io/chef/)
* Ensure Git client is installed
* `mkdir -p $HOME/chef/repo/data_bags/users`
* `echo "{ \"username\":\"$USER\" }" > $HOME/chef/repo/data_bags/users/user_info.json`
* `mkdir -p $HOME/chef/repo/cookbooks && cd $HOME/chef/repo/cookbooks`
* `git clone git@github.com:russauld/fedora_bootstrap.git`
* `sudo chef-solo --config-option cookbook_path=$HOME/chef/repo/cookbooks --config-option data_bag_path=$HOME/chef/repo/data_bags -o 'recipe[fedora_bootstrap]'`
