# Definition: karaf::instance
define karaf::instance (
  $ensure                       = 'present',
  $install_from                 = $karaf::params::install_from,
  $rootdir                      = $karaf::params::rootdir,
  $service_name                 = undef,
  $service_group_name           = $karaf::params::service_group_name,
  $service_group_id             = $karaf::params::service_group_id,
  $service_user_name            = $karaf::params::service_user_name,
  $service_user_id              = $karaf::params::service_user_id,
  $file_maven_settings          = $karaf::params::file_maven_settings,
  $mvn_repositories             = $karaf::params::mvn_repositories,
  $karaf_zip_url                = $karaf::params::karaf_zip_url,
  $karaf_file_name              = $karaf::params::karaf_file_name,
  $java_home                    = $karaf::params::java_home,
  $default_env_vars             = $karaf::params::default_env_vars,
  $karaf_version                = $karaf::params::version,
  $karaf_startup_feature_repos  = $karaf::params::karaf_startup_feature_repos,
  $karaf_startup_feature_boots  = $karaf::params::karaf_startup_feature_boots,
  $karaf_configuration_properties = $karaf::params::karaf_configuration_properties,
) {

  # ---------------------------------------------
  # Install dependencies.
  # ---------------------------------------------
  ensure_resource('package', 'unzip', {
    ensure => 'installed',
  })

  ensure_resource('package', 'wget', {
    ensure => 'installed',
  })

# ensure
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  $_service_name = pick($service_name, $name)

  $_instance_root = "${rootdir}/${name}"

  karaf::instance::install { $name:
    ensure             => $ensure,
    install_from       => $install_from,
    instance_root      => $_instance_root,
    service_name       => $_service_name,
    service_group_name => $service_group_name,
    service_group_id   => $service_group_id,
    service_user_name  => $service_user_name,
    service_user_id    => $service_user_id,
    karaf_zip_url      => $karaf_zip_url,
    karaf_file_name    => $karaf_file_name,
  }

  if ($ensure == 'present') {
    karaf::instance::configuration { $name:
      instance_root               => $_instance_root,
      service_user_name           => $service_user_name,
      service_group_name          => $service_group_name,
      file_maven_settings         => $file_maven_settings,
      mvn_repositories            => $mvn_repositories,
      java_home                   => $java_home,
      default_env_vars            => $default_env_vars,
      karaf_version               => $karaf_version,
      karaf_startup_feature_repos => $karaf_startup_feature_repos,
      karaf_startup_feature_boots => $karaf_startup_feature_boots,
      karaf_configuration_properties => $karaf_configuration_properties,
    }
  }

  karaf::instance::service { $name:
    ensure             => $ensure,
    instance_root      => $_instance_root,
    service_name       => $_service_name,
    service_user_name  => $service_user_name,
    service_group_name => $service_group_name,
  }
}
