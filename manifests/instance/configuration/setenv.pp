# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::setenv
define karaf::instance::configuration::setenv(
  $serverdir            = undef,
  $service_user_name    = undef,
  $service_group_name   = undef,
  $java_home            = undef,
  $default_env_vars     = undef,
) {
  ensure_resource (file, "${serverdir}/bin/setenv", {
    ensure  => file,
    content => template('karaf/karaf/bin/setenv.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  })
}