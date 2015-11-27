#
# Cookbook Name:: rails-app
# Recipe:: start-supervisor
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

# install dependencies

package "python-software-properties" do
  action :install
end

# start services

include_recipe "supervisor"

execute "start supervisord" do
  command "supervisord"
  cwd "/home/#{node[:app][:user]}/"
  not_if "ps aux | grep supervisord"
end
