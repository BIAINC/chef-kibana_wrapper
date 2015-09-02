#
# Cookbook Name:: kibana_wrapper
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# centos7 no /etc/init dir hack

# TODO: you need to create a cheker to see if these directories exist.
directory '/etc/init' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/sbin/status' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

node['wrapper_kibana']['dirs'].each do |curr|
  directory "#{curr}" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end

# install the chef-kibana recipe

include_recipe 'kibana'
include_recipe 'nginx'
include_recipe 'kibana::nginx'
include_recipe 'java'
include_recipe 'elasticsearch'


