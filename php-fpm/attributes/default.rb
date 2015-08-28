user = "nginx"
group = "nginx"
conf_dir = "/etc/php.d"
pool_conf_dir = "/etc/php-fpm.d"
conf_file = "/etc/php-fpm.conf"
error_log = "/var/log/php-fpm/error.log"
pid = "/var/run/php-fpm/php-fpm-5.6.pid"

default['wordpress_nginx']['s3_forward'] = 'https://s3.amazonaws.com/udextension/wp-content/uploads'
default['wordpress_nginx']['fastcgi_read_timeout'] = '3600s'
default['wordpress_nginx']['static_file_expiry'] = '24h'

default['php-fpm']['user'] = user
default['php-fpm']['group'] = group
default['php-fpm']['conf_dir'] = conf_dir
default['php-fpm']['pool_conf_dir'] = pool_conf_dir
default['php-fpm']['conf_file'] = conf_file
default['php-fpm']['pid'] = pid
default['php-fpm']['log_dir'] = '/var/log/php-fpm'
default['php-fpm']['error_log'] =  error_log
default['php-fpm']['log_level'] = "notice"
default['php-fpm']['emergency_restart_threshold'] = 0
default['php-fpm']['emergency_restart_interval'] = 0
default['php-fpm']['process_control_timeout'] = 0
default['php-fpm']['pools'] = {
  "www" => {
    :enable => true
  }
}

default['php-fpm']['skip_repository_install'] = true

default['php-fpm']['yum_url'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/"
default['php-fpm']['yum_mirrorlist'] = "http://rpms.famillecollet.com/enterprise/6.6/remi/mirror"

default['php-fpm']['dotdeb_repository']['uri'] = "http://packages.dotdeb.org"
default['php-fpm']['dotdeb_repository']['key'] = "http://www.dotdeb.org/dotdeb.gpg"
default['php-fpm']['dotdeb-php53_repository']['uri'] = "http://php53.dotdeb.org"
