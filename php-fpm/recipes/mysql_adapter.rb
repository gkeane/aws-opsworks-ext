package 'php-mysql' do
  package_name value_for_platform_family(
    'rhel' => 'php70-mysqlnd',
    'debian' => 'php70-mysql'
  )
end
