# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::shell
define karaf::instance::configuration::shell(
  $serverdir            = undef,
  $service_user_name    = undef,
  $service_group_name   = undef,
  $karaf_ssh_port       = undef,
  $karaf_ssh_host       = undef,
) {
  # Replace rmi registry port.
  ensure_resource(file_line, "${serverdir}-ssh-port", {
    path  => "${serverdir}/etc/org.apache.karaf.shell.cfg",
    line  => "sshPort = ${karaf_ssh_host}",
    match => "^sshPort =$"
  })

  # Replace rmi registry port.
  ensure_resource(file_line, "${serverdir}-ssh-host", {
    path  => "${serverdir}/etc/org.apache.karaf.shell.cfg",
    line  => "sshHost = ${karaf_ssh_port}",
    match => "^sshHost =$"
  })
}