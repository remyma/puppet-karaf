# PRIVATE CLASS - do not use directly
#
# Karaf configuration.
class karaf::configuration::custom_properties inherits karaf {
  file { "${rootdir}/karaf/etc/custom.properties":
    ensure  => file,
    content => template("karaf/karaf/etc/custom.properties.erb"),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}