# PRIVATE DEFINITION - do not use directly
#
# Definition: karaf::instance::configuration::rmi
define karaf::instance::configuration::rmi(
  $serverdir                = undef,
  $service_user_name        = undef,
  $service_group_name       = undef,
  $karaf_rmi_registry_host  = undef,
  $karaf_rmi_registry_port  = undef,
  $karaf_rmi_server_host    = undef,
  $karaf_rmi_server_port    = undef,
) {

  # Replace rmi registry port.
  ensure_resource(file_line, "${serverdir}-rmi-registry-port", {
    path  => "${serverdir}/etc/org.apache.karaf.management.cfg",
    line  => "rmiRegistryPort = ${karaf_rmi_registry_port}",
    match => "^rmiRegistryPort =$"
  })

  # Replace rmi registry port.
  ensure_resource(file_line, "${serverdir}-rmi-registry-host", {
    path  => "${serverdir}/etc/org.apache.karaf.management.cfg",
    line  => "rmiRegistryHost = ${karaf_rmi_registry_host}",
    match => "^rmiRegistryHost =$"
  })

  # Replace rmi server host.
  ensure_resource(file_line, "${serverdir}-rmi-server-port", {
    path  => "${serverdir}/etc/org.apache.karaf.management.cfg",
    line  => "rmiServerPort = ${karaf_rmi_server_port}",
    match => "^rmiServerPort =$"
  })

  # Replace rmi server host.
  ensure_resource(file_line, "${serverdir}-rmi-server-host", {
    path  => "${serverdir}/etc/org.apache.karaf.management.cfg",
    line  => "rmiServerHost = ${karaf_rmi_server_host}",
    match => "^rmiServerHost =$"
  })


}