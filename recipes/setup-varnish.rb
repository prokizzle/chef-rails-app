#
# Cookbook Name:: rails-app
# Recipe:: setup-varnish
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

apt_package 'apt-transport-https'
apt_package 'curl'

apt_repository 'varnish-cache' do
  uri 'https://repo.varnish-cache.org/ubuntu/'
  distribution 'precise'
  components ['varnish-4.0']
  key 'https://repo.varnish-cache.org/GPG-key.txt'
  deb_src true
end

execute "update apt sources" do
  command "apt-get update"
end

package 'varnish' do
  action 'install'
  notifies 'enable', 'service[varnish]', 'delayed'
  notifies 'restart', 'service[varnish]', 'delayed'
end

template '/etc/varnish/default.vcl' do
  source 'varnish.vcl.erb'
  mode 0744
  action :create
end

cookbook_file '/etc/default/varnish' do
  source 'varnish-config'
  mode 0744
  action :create
end

service 'varnish' do
  action :restart
end
