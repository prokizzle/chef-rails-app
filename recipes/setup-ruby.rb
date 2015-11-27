#
# Cookbook Name:: rails-app
# Recipe:: setup-ruby
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#


# install ruby dependencies

apt_package "build-essential"
apt_package "zlib1g-dev"
apt_package "libssl-dev"
apt_package "libreadline6-dev"
apt_package "libyaml-dev"
apt_package "libsqlite3-dev"
apt_package "libffi6"
apt_package "libffi-dev"
apt_package 'libxslt-dev'
apt_package 'libxml2-dev'
apt_package 'libmysqlclient-dev'
apt_package 'libmysqlclient18'
apt_package 'ruby-dev'
apt_package "libsqlite3-dev"

# install ruby

execute "download ruby" do
  cwd "/tmp"
  command "wget #{node[:ruby][:src_url]}"
  action :run
  not_if "[[ $(ruby -v) =~ #{node[:ruby][:version]} ]]"
end

execute "untar ruby" do
  cwd "/tmp"
  command "tar -xvzf ruby-#{node[:ruby][:version]}.tar.gz"
  action :run
  not_if "[[ $(ruby -v) =~ #{node[:ruby][:version]} ]]"
end

execute "configure ruby" do
  cwd "/tmp/ruby-#{node[:ruby][:version]}/"
  command "./configure --prefix=/usr/local --disable-install-doc"
  action :run
  not_if "[[ $(ruby -v) =~ #{node[:ruby][:version]} ]]"
end

execute "make" do
  cwd "/tmp/ruby-#{node[:ruby][:version]}/"
  command "make"
  action :run
  not_if "[[ $(ruby -v) =~ #{node[:ruby][:version]} ]]"
end

execute "make install" do
  cwd "/tmp/ruby-#{node[:ruby][:version]}/"
  command "make install"
  action :run
  not_if "[[ $(ruby -v) =~ #{node[:ruby][:version]} ]]"
end

gem_package "bundler"
