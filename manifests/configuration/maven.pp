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
      "puppet:///modules/${caller_module_name}/maven/settings.xml",
      "puppet:///modules/${caller_module_name}/maven/settings.xml.default"
    ],
    owner   => $service_user_name,
    group   => $service_group_name,
  }
}