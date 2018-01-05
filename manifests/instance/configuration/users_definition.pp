# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::users_definition.
define karaf::instance::configuration::users_definition(
  $rootdir                 = undef,
  $service_user_name       = undef,
  $service_group_name      = undef,
  $karaf_users_definition  = undef,
) {
  file { "${rootdir}/${name}/etc/users.properties":
    ensure  => file,
    content => template('karaf/karaf/etc/users.properties.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}