#
# Cookbook Name:: rails-app
# Recipe:: setup
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

include_recipe "#{node[:cookbook_name]}::create-user"
include_recipe "#{node[:cookbook_name]}::setup-ruby"
include_recipe "#{node[:cookbook_name]}::setup-git"
include_recipe "#{node[:cookbook_name]}::setup-supervisor"
include_recipe "#{node[:cookbook_name]}::create-support-directories"
include_recipe "#{node[:cookbook_name]}::setup-redis"

package "nodejs"

ohai "reload" do
  action :reload
end
