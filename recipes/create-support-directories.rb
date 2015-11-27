#
# Cookbook Name:: rails-app
# Recipe:: create-support-directories
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

directory "/home/#{node[:app][:user]}/logs/" do
  mode 0777
  owner "#{node[:app][:user]}"
  group "#{node[:app][:user]}"
  recursive true
  action :create
end

directory '/tmp/sockets' do
  action :create
end

directory '/tmp/pids' do
  action :create
end
