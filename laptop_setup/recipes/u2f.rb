#
# Cookbook:: laptop_setup
# Recipe:: u2f
#

apt_package "libpam-u2f"
apt_package "libpam-alreadyloggedin"

directory "#{node["user_home"]}/.config/Yubico" do
	owner node["user_name"]
	group node["user_name"]
	recursive true
end

execute "initialize yubikey" do
	command "pamu2fcfg > #{node["user_home"]}/.config/Yubico/u2f_keys"
	user node["user_name"]
	live_stream true
end

filter_lines "add u2f pam module" do
	path "/etc/pam.d/gdm-password"
	filters after: [/@include common-auth/, "auth required pam_u2f.so"]
end

filter_lines "add alreadyloggedin pam module" do
	path "/etc/pam.d/gdm-password"
	filters after: [/@include common-auth/, "auth sufficient pam_alreadyloggedin.so no_root"]
end
