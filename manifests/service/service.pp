# Definition: karaf::service::service
define karaf::service::service (
  $ensure             = $karaf::ensure,
  $rootdir            = undef,
  $service_name       = undef,
  $service_user_name  = undef,
  $service_group_name = undef,
) {
  $notify_service = Exec["${service_name}-systemd_reload_karaf"]

  exec { "${service_name}-systemd_reload_karaf":
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  }

  if ( $ensure == 'present' ) {
    $service_ensure = 'running'
    $service_enable = true

    file { "/lib/systemd/system/${service_name}.service":
      ensure  => file,
      content => template('karaf/etc/systemd/karaf.systemd.erb'),
    }
  } else {
    $service_ensure = 'stopped'
    $service_enable = false

    file { "/lib/systemd/system/${service_name}.service":
      ensure  => 'absent',
    }
  }


# action
  service { "service-${service_name}":
    ensure     => $service_ensure,
    enable     => $service_enable,
    name       => "${service_name}.service",
    hasstatus  => true,
    hasrestart => true,
    pattern    => $name,
    provider   => 'systemd',
    notify     => $notify_service,
  }
}
