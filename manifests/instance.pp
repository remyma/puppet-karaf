# Definition: karaf::instance
define karaf::instance (
  $install_from                 = undef,
  $rootdir                      = undef,
  $service_group_name           = undef,
  $service_group_id             = undef,
  $service_user_name            = undef,
  $service_user_id              = undef,
  $file_maven_settings          = undef,
  $mvn_repositories             = undef,
  $file_karaf_logging           = undef,
  $karaf_zip_url                = undef,
  $karaf_file_name              = undef,
  $karaf_custom_properties      = undef,
  $java_home                    = undef,
  $default_env_vars             = undef,
  $karaf_startup_feature_repos  = undef,
  $karaf_startup_feature_boots  = undef,
  $karaf_ssh_port               = undef,
  $karaf_ssh_host               = undef,
  $karaf_rmi_registry_host      = undef,
  $karaf_rmi_registry_port      = undef,
  $karaf_rmi_server_host        = undef,
  $karaf_rmi_server_port        = undef,
) {

  $_install_from = pick($install_from, $::karaf::install_from)
  $_rootdir = pick($rootdir, $karaf::rootdir)
  $_service_group_name = pick($service_group_name, $::karaf::service_group_name)
  $_service_group_id = pick($service_group_id, $::karaf::service_group_id)
  $_service_user_name = pick($service_user_name, $::karaf::service_user_name)
  $_service_user_id = pick($service_user_id, $::karaf::service_user_id)
  $_file_maven_settings = pick($file_maven_settings, $::karaf::file_maven_settings)
  $_mvn_repositories = pick($mvn_repositories, $::karaf::mvn_repositories)
  $_file_karaf_logging = pick($file_karaf_logging, $::karaf::file_karaf_logging)
  $_karaf_zip_url = pick($karaf_zip_url, $::karaf::karaf_zip_url)
  $_karaf_file_name = pick($karaf_file_name, $::karaf::karaf_file_name)
  $_karaf_custom_properties = pick($karaf_custom_properties, $::karaf::karaf_custom_properties)
  $_java_home = pick($java_home, $::karaf::java_home)
  $_default_env_vars = pick($default_env_vars, $::karaf::default_env_vars)
  $_karaf_startup_feature_repos = pick($karaf_startup_feature_repos, $::karaf::karaf_startup_feature_repos)
  $_karaf_startup_feature_boots = pick($karaf_startup_feature_boots, $::karaf::karaf_startup_feature_boots)

  $_karaf_ssh_port = pick($karaf_ssh_port, $::karaf::karaf_ssh_port)
  $_karaf_ssh_host = pick($karaf_ssh_host, $::karaf::karaf_ssh_host)

  $_karaf_rmi_registry_host = pick($karaf_rmi_registry_host, $::karaf::karaf_rmi_registry_host)
  $_karaf_rmi_registry_port = pick($karaf_rmi_registry_port, $::karaf::karaf_rmi_registry_port)
  $_karaf_rmi_server_host = pick($karaf_rmi_server_host, $::karaf::karaf_rmi_server_host)
  $_karaf_rmi_server_port = pick($karaf_rmi_server_port, $::karaf::karaf_rmi_server_port)

  karaf::install { $name:
    install_from       => $_install_from,
    rootdir            => $_rootdir,
    service_group_name => $_service_group_name,
    service_group_id   => $_service_group_id,
    service_user_name  => $_service_user_name,
    service_user_id    => $_service_user_id,
    karaf_zip_url      => $_karaf_zip_url,
    karaf_file_name    => $_karaf_file_name,
  }

  karaf::configuration { $name:
    service_user_name           => $_service_user_name,
    rootdir                     => $_rootdir,
    service_group_name          => $_service_group_name,
    file_maven_settings         => $_file_maven_settings,
    mvn_repositories            => $_mvn_repositories,
    file_karaf_logging          => $_file_karaf_logging,
    karaf_custom_properties     => $_karaf_custom_properties,
    java_home                   => $_java_home,
    default_env_vars            => $_default_env_vars,
    karaf_startup_feature_repos => $_karaf_startup_feature_repos,
    karaf_startup_feature_boots => $_karaf_startup_feature_boots,
    karaf_ssh_port              => $_karaf_ssh_port,
    karaf_ssh_host              => $_karaf_ssh_host,
    karaf_rmi_registry_host     => $_karaf_rmi_registry_host,
    karaf_rmi_registry_port     => $_karaf_rmi_registry_port,
    karaf_rmi_server_host       => $_karaf_rmi_server_host,
    karaf_rmi_server_port       => $_karaf_rmi_server_port,
  }

  karaf::service { $name:
    rootdir            => $_rootdir,
    service_user_name  => $_service_user_name,
    service_group_name => $_service_group_name,
  }

}
