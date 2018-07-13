# Definition: karaf::instance::configuration
define karaf::instance::configuration(
  $service_user_name            = undef,
  $service_group_name           = undef,
  $instance_root                = undef,
  $file_maven_settings          = undef,
  $mvn_repositories             = undef,
  $java_home                    = undef,
  $default_env_vars             = undef,
  $karaf_version                = undef,
  $karaf_startup_feature_repos  = undef,
  $karaf_startup_feature_boots  = undef,
  $karaf_configuration_properties = undef,
) {

  $serverdir = "${instance_root}/current"

  if size($mvn_repositories) > 0 {
    karaf::instance::configuration::maven { $name:
      serverdir           => $serverdir,
      service_user_name   => $service_user_name,
      service_group_name  => $service_group_name,
      file_maven_settings => $file_maven_settings,
      mvn_repositories    => $mvn_repositories
    }
  }

  karaf::instance::configuration::setenv { $name:
    serverdir        => $serverdir,
    java_home        => $java_home,
    default_env_vars => $default_env_vars,
  }

  $karaf_configuration_properties.each |String $config_file, $properties| {
    $properties.each |String $key, $value| {
      ensure_resource(file_line, "${serverdir}-${config_file}-${key}", {
        path  => "${serverdir}/etc/${config_file}",
        line  => "${key} = ${value}",
        match => "^${key} ="
      })
    }
  }

  if size($karaf_startup_feature_repos) > 0 or size($karaf_startup_feature_boots) > 0 {
    karaf::instance::configuration::features { $name:
      service_user_name           => $service_user_name,
      serverdir                   => $serverdir,
      service_group_name          => $service_group_name,
      karaf_version               => $karaf_version,
      karaf_startup_feature_repos => $karaf_startup_feature_repos,
      karaf_startup_feature_boots => $karaf_startup_feature_boots,
    }
  }
}