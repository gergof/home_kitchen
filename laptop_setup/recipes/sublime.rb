#
# Cookbook:: laptop_setup
# Recipe:: sublime
#

apt_repository "sublime" do
	uri "https://download.sublimetext.com/"
	distribution "apt/stable/"
	key "https://download.sublimetext.com/sublimehq-pub.gpg"
end

apt_update "apt update"

apt_package "sublime-text"
apt_package "sublime-merge"
