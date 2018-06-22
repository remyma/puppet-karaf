# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::system
define karaf::instance::configuration::system(
  $serverdir              = undef,
  $service_user_name    = undef,
  $service_group_name   = undef,
) {
  ensure_resource(file, "${serverdir}/etc/system.properties", {
    ensure  => file,
    content => template('karaf/karaf/etc/system.properties.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  })
}