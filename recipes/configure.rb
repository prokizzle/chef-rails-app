include_recipe "#{node[:cookbook_name]}::setup-keys"
include_recipe "#{node[:cookbook_name]}::nginx"
include_recipe "#{node[:cookbook_name]}::setup-varnish"
