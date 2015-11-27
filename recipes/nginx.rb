#
# Cookbook Name:: rails-app
# Recipe:: nginx
#
# Copyright 2013, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

package 'nginx'

# install nginx configuration files

template '/etc/nginx/sites-available/default' do
  source 'nginx.conf.erb'
  mode 0744
end

cookbook_file "/home/#{node[:app][:user]}/.ssh/#{node[:app][:ssl_cert_name]}.crt" do
  source "#{node[:app][:ssl_cert_name]}.crt"
  mode 0700
  action :create
end

cookbook_file "/home/#{node[:app][:user]}/.ssh/#{node[:app][:ssl_cert_name]}.key" do
  source "#{node[:app][:ssl_cert_name]}.key"
  mode 0700
  action :create
end

cookbook_file "/home/#{node[:app][:user]}/.ssh/#{node[:app][:deploy_key]}" do
  source "#{node[:app][:deploy_key]}"
  mode 0700
  action :create
end

cookbook_file "/home/#{node[:app][:user]}/.ssh/#{node[:app][:deploy_key]}.pub" do
  source "#{node[:app][:deploy_key]}.pub"
  mode 0700
  action :create
end

service 'nginx' do
  action :restart
end
