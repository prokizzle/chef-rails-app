#
# Cookbook Name:: rails-app
# Recipe:: setup-git
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

directory "/home/#{node[:app][:user]}/.ssh" do
  owner node[:app][:user]
  group node[:app][:user]
  action :create
end

execute "add github to known hosts" do
  command "ssh-keyscan -H github.com > /etc/ssh/ssh_known_hosts"
end

template "/home/#{node[:app][:user]}/.ssh/ssh_wrapper.sh" do
  source 'ssh_wrapper.sh.erb'
  owner node[:app][:user]
  group node[:app][:user]
  mode '0755'
end

template "/home/#{node[:app][:user]}/.ssh/config" do
  source 'git-config.conf.erb'
  owner node[:app][:user]
  group node[:app][:user]
  mode '0755'
end

apt_package "git"

service 'ssh' do
  action :reload
end
