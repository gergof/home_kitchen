#
# Cookbook:: laptop_setup
# Recipe:: nodejs
#

apt_repository "nodejs" do
	uri "https://deb.nodesource.com/node_10.x"
	components ["main"]
	key "https://deb.nodesource.com/gpgkey/nodesource.gpg.key"
end

apt_update "apt update"

apt_package "nodejs"
