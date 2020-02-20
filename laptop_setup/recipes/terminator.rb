#
# Cookbook:: laptop_setup
# Recipe:: terminator
#

directory "#{node["user_home"]}/.config/terminator" do
	owner node["user_name"]
	group node["user_name"]
	recursive true
end

template "#{node["user_home"]}/.config/terminator/config" do
	source "terminator_config.erb"
	owner node["user_name"]
	group node["user_name"]
end
