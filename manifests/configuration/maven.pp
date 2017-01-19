# PRIVATE CLASS - do not use directly
#
# Karaf maven configuration.
class karaf::configuration::maven inherits karaf {

  # Ensure m2 directory exists.
  file { "/home/${service_user_name}/.m2":
    ensure => 'directory',
    owner   => $service_user_name,
    group   => $service_group_name,
  }

  # Deploy settings from file if needed.
  file { "/home/${service_user_name}/.m2/settings.xml":
    ensure => present,
    source => [
      $file_maven_settings
    ],
    owner   => $service_user_name,
    group   => $service_group_name,
  }

  # Deploy ops4j mvn config file.
  file { "${rootdir}/karaf/etc/org.ops4j.pax.url.mvn.cfg":
    ensure  => file,
    content => template("karaf/karaf/etc/org.ops4j.pax.url.mvn.cfg.erb"),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}