package 'php-pecl-memcached' do
  package_name value_for_platform_family(
    'rhel' => 'php7-pecl-memcached',
    'debian' => 'php-pecl-memcached'
  )
end

package 'php-pecl-memcache' do
  package_name value_for_platform_family(
    'rhel' => 'php7-pecl-memcache',
    'debian' => 'php-pecl-memcache'
  )
end

package 'php-gd' do
  package_name value_for_platform_family(
    'rhel' => 'php7-gd',
    'debian' => 'php-gd'
  )
end

package 'php-opcache' do
  package_name value_for_platform_family(
    'rhel' => 'php7-opcache',
    'debian' => 'php-gd'
  )
end

