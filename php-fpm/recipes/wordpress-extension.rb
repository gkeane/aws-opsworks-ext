node[:deploy].each do |application, deploy|  
  template "#{node['nginx']['dir']}/wordpress.conf" do
    source   'wordpress-extension.erb'
    owner    'root'
    group    'root'
    mode     00644
  end
end
