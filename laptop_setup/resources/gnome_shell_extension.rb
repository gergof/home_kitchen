resource_name :gnome_shell_extension

property :instance_name, String, name_property: true
property :url, String, required: true

action :install do
	directory "#{node["user_home"]}/.local/share/gnome-shell/extensions" do
		owner node["user_name"]
		group node["user_name"]
		recursive true
	end

	remote_file "/tmp/tmp_extension.zip" do
		source new_resource.url
	end

	archive_file "/tmp/tmp_extension.zip" do
		destination "#{node["user_home"]}/.local/share/gnome-shell/extensions/#{new_resource.instance_name}"
		owner node["user_name"]
		group node["user_name"]
		overwrite true
	end

	execute "chown" do
		command "chown -R #{node["user_name"]}:#{node["user_name"]} #{node["user_home"]}/.local/share/gnome-shell/extensions/#{new_resource.instance_name}"
	end

	execute "chmod" do
		command "chmod -R 755 #{node["user_home"]}/.local/share/gnome-shell/extensions/#{new_resource.instance_name}"
	end
	
	execute "enable extension" do
		command "sudo -Hu #{node["user_name"]} dbus-launch gnome-shell-extension-tool -e #{new_resource.instance_name}"
		returns [0, 1]
	end
end
