# PRIVATE CLASS - do not use directly
#
# Karaf configuration.
define karaf::configuration::custom_properties(
  $rootdir                 = undef,
  $service_user_name       = undef,
  $service_group_name      = undef,
  $karaf_custom_properties = undef,
) {
  file { "${rootdir}/karaf-${name}/etc/custom.properties":
    ensure  => file,
    content => template('karaf/karaf/etc/custom.properties.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}