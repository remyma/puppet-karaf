# PRIVATE CLASS - do not use directly
#
# Karaf system configuration.
class karaf::configuration::system inherits karaf {
  file { "${rootdir}/karaf/etc/system.properties":
    ensure  => file,
    content => template("karaf/karaf/etc/system.properties.erb"),
  }
}