package 'php-mysql' do
  package_name value_for_platform_family(
    'rhel' => 'php7-mysqlnd',
    'debian' => 'php7-mysql'
  )
end
