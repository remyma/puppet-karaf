# PRIVATE CLASS - do not use directly
#
# Karaf features configuration.
define karaf::configuration::features(
  $rootdir                     = undef,
  $service_user_name           = undef,
  $service_group_name          = undef,
  $karaf_startup_feature_repos = undef,
  $karaf_startup_feature_boots = undef,
) {
  file { "${rootdir}/${name}/etc/org.apache.karaf.features.cfg":
    ensure  => file,
    content => template('karaf/karaf/etc/org.apache.karaf.features.cfg.erb'),
    owner   => $service_user_name,
    group   => $service_group_name
  }
}