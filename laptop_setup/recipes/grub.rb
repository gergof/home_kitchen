#
# Cookbook:: laptop_setup
# Recipe:: grub
#

replace_or_add "grub timeout" do
	path "/etc/default/grub"
	pattern "GRUB_TIMEOUT=*"
	line "GRUB_TIMEOUT=0"
end

replace_or_add "disable quiet mode" do
	path "/etc/default/grub"
	pattern "GRUB_CMDLINE_LINUX_DEFAULT=*"
	line "GRUB_CMDLINE_LINUX_DEFAULT=\"\""
end

execute "update-grub" do
	command "/sbin/update-grub"
end
