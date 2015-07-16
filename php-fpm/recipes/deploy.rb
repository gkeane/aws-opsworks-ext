#
# Cookbook Name:: php-fpm
# Recipe:: deploy
#
 
include_recipe 'deploy'
include_recipe 'nginx::service'

 
node[:deploy].each do |application, deploy|
  # We're not using rails apps. This this will never be overridden in a php-fpm deploy as custom json. 
  # Ddd this to deploy, so that way we can make sure only this app is deployed.
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping php-fpm::deploy application #{application} as it is not a php application")
    next
  else
    Chef::Log.debug("Deploying application #{application}.")
  end
 
  if deploy[:application_type] != 'php' 
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP-FPM app")
    next
  end
 
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end
 
  opsworks_deploy do
    app application
    deploy_data deploy
    template "/etc/nginx/global/wordpress.conf" do
      source   'wordpress.erb'
      owner    'root'
      group    'root'
      mode     00644
    end
  end

  node[:deploy].each do |application, deploy|
    app_root = "#{deploy[:deploy_to]}/current/wp-content"
    execute "chown -R #{deploy[:user]}:#{deploy[:user]} #{app_root}" do
    end 
  end
  nginx_web_app application do
    application deploy
  #  template "#{node['nginx']['dir']}/global/restrictions.conf" do
    #  source   'restrictions.erb'
     # owner    'root'
     # group    'root'
      #mode     00644
    #end
  #  cookbook deploy.has_key?("application_alias") ? deploy[:application_alias] : application
  end

end
