# PRIVATE CLASS - do not use directly
#
# Karaf maven configuration.
class karaf::configuration::maven inherits karaf {

  # Deploy settings from file if needed.
  file { "/home/${service_user_name}/settings.xml":
    ensure => present,
    source => "puppet:///modules/karaf/settings.xml"
  }
}