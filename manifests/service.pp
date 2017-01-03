class karaf::service inherits karaf {

  file { '/lib/systemd/system/karaf.service':
    ensure  => file,
    content => template("karaf/etc/systemd/karaf.systemd.erb"),
  }

  $notify_service = Exec["systemd_reload_karaf"]


  exec { "systemd_reload_karaf":
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  }

  # action
  service { "service-karaf":
    ensure     => 'running',
    enable     => true,
    name       => "karaf.service",
    hasstatus  => true,
    hasrestart => true,
    pattern    => $karaf::params::service_name,
    provider   => 'systemd',
    notify     => $notify_service,
  }
}