#
# Cookbook:: laptop_setup
# Recipe:: riot
#

apt_repository "riot" do
	uri "https://packages.riot.im/debian/"
	components ["main"]
	key "https://packages.riot.im/debian/riot-im-archive-keyring.gpg"
end

apt_update "apt update"

apt_package "riot-web"
