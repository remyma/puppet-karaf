# Definition: karaf::instance::service
define karaf::instance::service(
  $ensure             = $karaf::ensure,
  $rootdir            = undef,
  $service_provider   = $karaf::params::service_provider,
  $service_name       = undef,
  $service_user_name  = undef,
  $service_group_name = undef,
) {

  case $service_provider {
    'init': {
      karaf::service::service { $name:
        ensure             => $ensure,
        rootdir            => $rootdir,
        service_name       => $service_name,
        service_user_name  => $service_user_name,
        service_group_name => $service_group_name,
      }
    }
    'systemd': {
      karaf::service::systemd { $name:
        ensure             => $ensure,
        rootdir            => $rootdir,
        service_name       => $service_name,
        service_user_name  => $service_user_name,
        service_group_name => $service_group_name,
      }
    }
    default: {
      fail("Unknown service provider ${service_provider}")
    }
  }
}