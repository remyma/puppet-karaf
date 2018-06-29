# Definition: karaf::instance::configuration
define karaf::instance::configuration(
  $service_user_name            = undef,
  $instance_root                = undef,
  $service_group_name           = undef,
  $file_maven_settings          = undef,
  $mvn_repositories             = undef,
  $file_karaf_logging           = undef,
  $karaf_custom_properties      = undef,
  $karaf_users_definition       = undef,
  $java_home                    = undef,
  $default_env_vars             = undef,
  $karaf_version                = undef,
  $karaf_startup_feature_repos  = undef,
  $karaf_startup_feature_boots  = undef,
  $karaf_ssh_port               = undef,
  $karaf_ssh_host               = undef,
  $karaf_rmi_registry_host      = undef,
  $karaf_rmi_registry_port      = undef,
  $karaf_rmi_server_host        = undef,
  $karaf_rmi_server_port        = undef,
) {

  $serverdir = "${instance_root}/current"

  karaf::instance::configuration::maven { $name:
    serverdir           => $serverdir,
    service_user_name   => $service_user_name,
    service_group_name  => $service_group_name,
    file_maven_settings => $file_maven_settings,
    mvn_repositories    => $mvn_repositories
  }

  karaf::instance::configuration::custom_properties { $name:
    serverdir               => $serverdir,
    karaf_custom_properties => $karaf_custom_properties
  }

  karaf::instance::configuration::users_definition { $name:
    serverdir               => $serverdir,
    karaf_users_definition  => $karaf_users_definition
  }

  karaf::instance::configuration::setenv { $name:
    serverdir          => $serverdir,
    java_home          => $java_home,
    default_env_vars   => $default_env_vars,
  }

  karaf::instance::configuration::shell { $name:
    serverdir          => $serverdir,
    karaf_ssh_port     => $karaf_ssh_port,
    karaf_ssh_host     => $karaf_ssh_host,
  }

  karaf::instance::configuration::features { $name:
    service_user_name           => $service_user_name,
    serverdir                   => $serverdir,
    service_group_name          => $service_group_name,
    karaf_version               => $karaf_version,
    karaf_startup_feature_repos => $karaf_startup_feature_repos,
    karaf_startup_feature_boots => $karaf_startup_feature_boots,
  }

  karaf::instance::configuration::logging { $name:
    service_user_name  => $service_user_name,
    serverdir          => $serverdir,
    service_group_name => $service_group_name,
    file_karaf_logging => $file_karaf_logging,
  }

  karaf::instance::configuration::rmi { $name:
    serverdir               => $serverdir,
    karaf_rmi_registry_host => $karaf_rmi_registry_host,
    karaf_rmi_registry_port => $karaf_rmi_registry_port,
    karaf_rmi_server_host   => $karaf_rmi_server_host,
    karaf_rmi_server_port   => $karaf_rmi_server_port,
  }
}