# PRIVATE CLASS - do not use directly
#
# Karaf features configuration.
class karaf::configuration::features inherits karaf {
  file { "${rootdir}/karaf/etc/org.apache.karaf.features.cfg":
    ensure  => file,
    content => template("karaf/karaf/etc/org.apache.karaf.features.cfg.erb"),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}