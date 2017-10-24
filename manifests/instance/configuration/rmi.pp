# PRIVATE DEFINITION - do not use directly
#
# Definition: karaf::instance::configuration::rmi
define karaf::instance::configuration::rmi(
  $rootdir                  = undef,
  $service_user_name        = undef,
  $service_group_name       = undef,
  $karaf_rmi_registry_host  = undef,
  $karaf_rmi_registry_port  = undef,
  $karaf_rmi_server_host    = undef,
  $karaf_rmi_server_port    = undef,
) {

  # Deploy ops4j mvn config file.
  ensure_resource(file, "${rootdir}/${name}/etc/org.apache.karaf.management.cfg", {
    ensure  => file,
    content => template('karaf/karaf/etc/org.apache.karaf.management.cfg.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  })
}