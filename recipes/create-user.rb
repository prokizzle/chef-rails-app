#
# Cookbook Name:: rails-app
# Recipe:: create-user
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

user "#{node[:app][:user]}" do
  home "/home/#{node[:app][:user]}/"
  supports :manage_home => true
  action :create
  ignore_failure true
end
