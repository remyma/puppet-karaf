# Definition: karaf::service::systemd
define karaf::service::systemd (
  $ensure             = $karaf::ensure,
  $rootdir            = undef,
  $service_user_name  = undef,
  $service_group_name = undef,
) {
  $notify_service = Exec["${name}-systemd_reload_karaf"]

  exec { "${name}-systemd_reload_karaf":
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  }

  if ( $ensure == 'present' ) {
    $service_ensure = 'running'
    $service_enable = true

    file { "/lib/systemd/system/${name}.service":
      ensure  => file,
      content => template('karaf/etc/systemd/karaf.systemd.erb'),
    }
  } else {
    $service_ensure = 'stopped'
    $service_enable = false

    file { "/lib/systemd/system/${name}.service":
      ensure  => 'absent',
    }
  }


# action
  service { "service-${name}":
    ensure     => $service_ensure,
    enable     => $service_enable,
    name       => "${name}.service",
    hasstatus  => true,
    hasrestart => true,
    pattern    => $name,
    provider   => 'systemd',
    notify     => $notify_service,
  }
}
