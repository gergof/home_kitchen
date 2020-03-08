#
# Cookbook:: laptop_setup
# Recipe:: virtualbox
#

apt_repository "virtualbox" do
	uri "http://download.virtualbox.org/virtualbox/debian"
	components ["contrib"]
	key "https://www.virtualbox.org/download/oracle_vbox_2016.asc"
end

apt_update "apt_update"

apt_package "virtualbox-6.1"
