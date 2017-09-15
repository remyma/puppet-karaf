# Definition: karaf::service
define karaf::service(
  $rootdir            = undef,
  $service_user_name  = undef,
  $service_group_name = undef,
) {

  $service_name = "karaf-${name}"

  file { "/lib/systemd/system/${service_name}.service":
    ensure  => file,
    content => template('karaf/etc/systemd/karaf.systemd.erb'),
  }

  $notify_service = Exec["${name}-systemd_reload_karaf"]

  exec { "${name}-systemd_reload_karaf":
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  }

  # action
  service { "service-${service_name}":
    ensure     => 'running',
    enable     => true,
    name       => "${service_name}.service",
    hasstatus  => true,
    hasrestart => true,
    pattern    => $service_name,
    provider   => 'systemd',
    notify     => $notify_service,
  }
}