# Definition: karaf::service::service
define karaf::service::service (
  $ensure             = $karaf::ensure,
  $rootdir            = undef,
  $service_name       = undef,
  $service_user_name  = undef,
  $service_group_name = undef,
) {
  $notify_service = Service["service-${service_name}"]

  if ($ensure == 'present') {
    $service_ensure = 'running'
    $service_enable = true

    file { "/etc/init.d/${service_name}":
      ensure  => file,
      mode    => '0755',
      content => template('karaf/etc/init/karaf.init.erb'),
      notify  => $notify_service,
    }
  } else {
    $service_ensure = 'stopped'
    $service_enable = false

    file { "/etc/init.d/${service_name}":
      ensure  => 'absent',
    }
  }

  # action
  service { "service-${service_name}":
    ensure     => $service_ensure,
    enable     => $service_enable,
    name       => $service_name,
    hasstatus  => true,
    hasrestart => true,
    pattern    => $service_name,
  }
}
