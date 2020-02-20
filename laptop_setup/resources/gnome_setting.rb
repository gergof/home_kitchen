resource_name :gnome_setting

property :domain, String, required: true
property :setting, String, required: true
property :value, String, required: true

action :set do
	execute "set setting" do
		command "sudo -Hu #{node["user_name"]} dbus-launch gsettings set #{new_resource.domain} #{new_resource.setting} #{new_resource.value}"
	end
end
