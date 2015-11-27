#
# Cookbook Name:: rails-app
# Recipe:: deploy-qa
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

# update files

git "/home/#{node[:app][:user]}/#{node[:app][:name]}" do
  user node[:app][:user]
  repository "git@github.com:#{node[:app][:short_git_url]}"
  revision node[:app][:qa_branch]
  ssh_wrapper "/home/#{node[:app][:user]}/.ssh/ssh_wrapper.sh"
  action :sync
end

include_recipe "#{node[:cookbook_name]}::deploy"
