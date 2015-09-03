#
# Cookbook Name:: kibana_wrapper
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

kib = node.td.kibana
node.set['kibana']['nginx'] = node['nginx']

kibana_user kib.username do
  name kib.username
  group kib.groupname
  home kib.home_dir
end

kibana_install kib.name do
  name kib.name
  user kib.username
  group kib.groupname
  install_dir kib.install_dir
  install_type 'file'
end

kibana_web kib.name do
  type 'nginx'
  listen_port kip.nginx_listen_port
  server_name node.name
  template 'kibana-nginx_file.conf.erb'
end

template "/etc/systemd/system/#{kib.name}.service" do
  source 'kibana.service.erb'
  cookbook 'kibana_wrapper'
  owner 'root'
  mode 0755
  variables(
    user: kib.username,
    bindir: "#{node.td.kibana.install_dir}/current/bin",
    service_name: kib.name,
    args: ''
  )
end

service kib.name do
  action [:enable,:start]
end
