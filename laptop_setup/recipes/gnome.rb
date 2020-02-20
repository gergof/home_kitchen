#
# Cookbook:: laptop_setup
# Recipe:: gnome
#

gnome_setting "disable natural scroll" do
	domain "org.gnome.desktop.peripherals.touchpad"
	setting "natural-scroll"
	value "false"
end

gnome_setting "enable tap to click" do
	domain "org.gnome.desktop.peripherals.touchpad"
	setting "tap-to-click"
	value "true"
end

gnome_setting "enable two-finger scrolling" do
	domain "org.gnome.desktop.peripherals.touchpad"
	setting "two-finger-scrolling-enabled"
	value "true"
end

gnome_setting "set favorites" do
	domain "org.gnome.shell"
	setting "favorite-apps"
	value "\"['org.gnome.Nautilus.desktop', 'chromium.desktop', 'terminator.desktop', 'sublime_text.desktop', 'sublime_merge.desktop', 'riot-web.desktop']\""
end

apt_package "chrome-gnome-shell"
apt_package "lm-sensors"

gnome_shell_extension "Uptime@lapi" do
	url "https://extensions.gnome.org/extension-data/Uptime%40lapi.v2.shell-extension.zip"
end

gnome_shell_extension "freon@UshakovVasilii_Github.yahoo.com" do
	url "https://extensions.gnome.org/extension-data/freon%40UshakovVasilii_Github.yahoo.com.v35.shell-extension.zip"
end

gnome_shell_extension "appindicatorsupport@rgcjonas.gmail.com" do
	url "https://extensions.gnome.org/extension-data/appindicatorsupportrgcjonas.gmail.com.v26.shell-extension.zip"
end

gnome_shell_extension "gnome-shell-screenshot@ttll.de" do
	url "https://extensions.gnome.org/extension-data/gnome-shell-screenshotttll.de.v40.shell-extension.zip"
end
