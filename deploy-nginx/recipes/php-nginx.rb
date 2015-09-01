#
# Cookbook Name:: deploy
# Recipe:: php
#

include_recipe 'deploy'


node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

    directory "/etc/nginx/global/" do
      mode 0755
      owner 'nginx'
      group 'nginx'
      action :create
    end 

  template "#{node[:nginx][:dir]}/global/wordpress.conf" do
    source   'wordpress.conf.erb'
    owner    'nginx'
    group    'nginx'
    mode     00644
  end
#    template "#{node[:nginx][:dir]}/global/restrictions.conf" do
#      source   'restrictions.erb'
#      owner    'nginx'
#      group    'nginx'
#      mode     00644
#    end

  opsworks_deploy do
    deploy_data deploy
    app application
  end
end
