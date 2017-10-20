# Definition: karaf::service
define karaf::service(
  $ensure             = $karaf::ensure,
  $rootdir            = undef,
  $service_provider   = $karaf::params::service_provider,
  $service_user_name  = undef,
  $service_group_name = undef,
) {

  case $service_provider {
    'init': {
      karaf::service::init { $name:
        ensure             => $ensure,
        rootdir            => $rootdir,
        service_user_name  => $service_user_name,
        service_group_name => $service_group_name,
      }
    }
    'systemd': {
      karaf::service::systemd { $name:
        ensure             => $ensure,
        rootdir            => $rootdir,
        service_user_name  => $service_user_name,
        service_group_name => $service_group_name,
      }
    }
    default: {
      fail("Unknown service provider ${karaf::real_service_provider}")
    }
  }
}