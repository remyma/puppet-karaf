# PRIVATE DEFINITION - do not use directly
#
# Karaf maven configuration.
define karaf::configuration::maven(
  $service_user_name    = undef,
  $rootdir              = undef,
  $service_group_name   = undef,
  $file_maven_settings  = undef,
  $mvn_repositories     = undef,
) {

  # Ensure m2 directory exists.
  ensure_resource(file, "/home/${service_user_name}/.m2", {
    ensure => 'directory',
    owner  => $service_user_name,
    group  => $service_group_name,
  })

  # Deploy settings from file if needed.
  ensure_resource(file, "/home/${service_user_name}/.m2/settings.xml", {
    ensure => present,
    source => [
      $file_maven_settings
    ],
    owner  => $service_user_name,
    group  => $service_group_name,
  })

  # Deploy ops4j mvn config file.
  ensure_resource(file, "${rootdir}/karaf-${name}/etc/org.ops4j.pax.url.mvn.cfg", {
    ensure  => file,
    content => template('karaf/karaf/etc/org.ops4j.pax.url.mvn.cfg.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  })
}