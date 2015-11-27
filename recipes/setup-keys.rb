#
# Cookbook Name:: rails-app
# Recipe:: setup-keys
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

[
  "#{node[:app][:deploy_key]}",
  "#{node[:app][:deploy_key]}.pub"
].each do |file|
  cookbook_file "/home/#{node[:app][:user]}/.ssh/#{file}" do
    source file
    mode 0600
    owner "#{node[:app][:user]}"
    group "#{node[:app][:user]}"
  end
end

[
  "#{node[:app][:ssl_cert_name]}.crt",
  "#{node[:app][:ssl_cert_name]}.key"
].each do |file|
  cookbook_file "/home/#{node[:app][:user]}/.ssh/#{file}" do
    source file
    mode 0600
    owner "#{node[:app][:user]}"
    group "#{node[:app][:user]}"
  end
end

if node[:app][:old_ssl_cert_name]
  [
    "#{node[:app][:old_ssl_cert_name]}.crt",
    "#{node[:app][:old_ssl_cert_name]}.key"
  ].each do |file|
    cookbook_file "/home/#{node[:app][:user]}/.ssh/#{file}" do
      source file
      mode 0600
      owner "#{node[:app][:user]}"
      group "#{node[:app][:user]}"
    end
  end
end

service 'ssh' do
  action :reload
end
