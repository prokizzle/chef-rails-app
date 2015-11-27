#
# Cookbook Name:: rails-app
# Recipe:: setup-redis
#
# Copyright 2015, Nick Prokesch
#
# All rights reserved - Do Not Redistribute
#

# install and setup redis

include_recipe "redis::server_source"

cookbook_file "/usr/src/redis/redis.conf" do
  source "redis.conf"
end
