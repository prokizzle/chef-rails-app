#
# Cookbook Name:: rails-app
# Recipe:: setup-dev
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

# install dependencies
apt_package 'build-essential'
apt_package 'libxslt1-dev'
apt_package 'libxml2-dev'
apt_package 'libmysqlclient-dev'
apt_package 'libmysqlclient18'
apt_package 'ruby-dev'
apt_package 'cifs-utils'

gem_package 'mailcatcher'

supervisor_service "mailcatcher" do
  action :enable
  #user "portal"
  autostart false
  autorestart false
  directory "/home/#{node[:app][:user]}/#{node[:app][:name]}/"
  command "mailcatcher -f"
  stdout_logfile "/home/#{node[:app][:user]}/logs/supervisord_mailcatcher.txt"
  stdout_logfile_maxbytes "10MB"
  stderr_logfile "/home/#{node[:app][:user]}/logs/supervisord_mailcatcher.txt"
  stderr_logfile_maxbytes "10MB"
end

execute "bundle install" do
  command "bundle install"
  cwd "/home/#{node[:app][:user]}/#{node[:app][:name]}"
end

# clean & compile assets
execute "clean assets" do
  command "bundle exec rake assets:clean"
  cwd "/home/#{node[:app][:user]}/#{node[:app][:name]}"
end

supervisor_service "mailcatcher" do
  action :restart
end
