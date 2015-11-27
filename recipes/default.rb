#
# Cookbook Name:: rails-app
# Recipe:: default
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe "#{node[:cookbook_name]}::setup"
include_recipe "#{node[:cookbook_name]}::configure"
