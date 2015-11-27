#
# Cookbook Name:: rails-app
# Recipe:: deploy
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

# create redis supervisor instance
supervisor_service "redis-server" do
  action :enable
  directory "/home/#{node[:app][:user]}/"
  command node['redis']['dst_dir'] + "/bin/redis-server"
  stdout_logfile "/home/#{node[:app][:user]}/logs/supervisord_redis.txt"
  stdout_logfile_maxbytes "10MB"
  stderr_logfile "/home/#{node[:app][:user]}/logs/supervisord_redis.txt"
  stderr_logfile_maxbytes "10MB"
end

# create supervisor process

supervisor_service 'rails-server' do
  action :enable
  autostart false
  autorestart true
  directory "/home/#{node[:app][:user]}/#{node[:app][:name]}/"
  command "bundle exec puma -e production -p 3000"
  stdout_logfile "/home/#{node[:app][:user]}/logs/supervisord_rails.txt"
  stdout_logfile_maxbytes "10MB"
  stderr_logfile "/home/#{node[:app][:user]}/logs/supervisord_rails.txt"
  stderr_logfile_maxbytes "10MB"
end

# install dependencies

execute "bundle install" do
  command "bundle install"
  cwd "/home/#{node[:app][:user]}/#{node[:app][:name]}"
end

# clean & compile assets
execute "clean assets" do
  command "bundle exec rake assets:clean RAILS_ENV=production"
  cwd "/home/#{node[:app][:user]}/#{node[:app][:name]}"
end

execute "precompile assets" do
  command "bundle exec rake assets:precompile RAILS_ENV=production"
  cwd "/home/#{node[:app][:user]}/#{node[:app][:name]}"
end

# start services

supervisor_service "redis-server" do
  action :restart
end

supervisor_service 'rails-server' do
  action :restart
end
