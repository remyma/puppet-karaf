# PRIVATE CLASS - do not use directly
#
# Karaf shell configuration.
define karaf::configuration::shell(
  $rootdir              = undef,
  $service_user_name    = undef,
  $service_group_name   = undef,
  $karaf_ssh_port       = undef,
  $karaf_ssh_host       = undef,
) {
  file { "${rootdir}/karaf-${name}/etc/org.apache.karaf.shell.cfg":
    ensure  => file,
    content => template('karaf/karaf/etc/org.apache.karaf.shell.cfg.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}