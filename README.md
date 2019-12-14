# fedora_bootstrap

This cookbook configures a Fedora Workstation just the way that Russ likes it.
It installs packages and gets it all nice nice.

Feel free to copy and modify as you like.

* Install Chef Infra Client from [here](https://downloads.chef.io/chef/)
* Ensure Git client is installed
* `mkdir -p $HOME/chef/repo/cookbooks && cd $HOME/chef/repo/cookbooks`
* `git clone git@github.com:russauld/fedora_bootstrap.git`
* `sudo chef-solo --config-option cookbook_path=$HOME/chef/repo/cookbooks -o 'recipe[fedora_bootstrap]'`
* 

