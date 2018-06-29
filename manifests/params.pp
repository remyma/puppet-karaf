# PRIVATE CLASS - do not use directly
#
# The karaf default configuration settings.
class karaf::params {

  # Default install dir.
  $rootdir            = '/opt'

  # Default karaf version to install
  $version            = '4.2.0'

  # Value could be 'web' or 'file'. Choose if karaf should be installed from web
  # or from file. If file, please provide zip archive in files directory.
  $install_from       = 'web'

  # url to download karaf in case install is done from the web
  $karaf_zip_url = "http://apache.mediamirrors.org/karaf/${version}/apache-karaf-${version}.zip"

  # name of zip file to be placed in files directory in case install is done from file
  $karaf_file_name    = "apache-karaf-${version}"

  $service_user_name  = 'karaf'
  $service_user_id    = 5000
  $service_group_name = 'karaf'
  $service_group_id   = 5000

  # --------------------------------
  # Service variables.
  # --------------------------------
  $service_name       = 'karaf'
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'OracleLinux', 'SLC': {

      if versioncmp($::operatingsystemmajrelease, '7') >= 0 {
        $service_provider    = 'systemd'
      } else {
        $service_provider    = 'init'
      }
    }
    default: {
      fail("\"${module_name}\" provides no service parameters
            for \"${::operatingsystem}\"")
    }
  }

  # --------------------------------
  # Java home
  # --------------------------------
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'OracleLinux', 'SLC': {

      if versioncmp($::operatingsystemmajrelease, '7') < 0 {
        $java_home = '/usr/lib/jvm/jre-1.8.0-openjdk.x86_64'
      } else {
        $java_home = '/usr/lib/jvm/java-1.8.0-openjdk'
      }
    }
    default: {
      $java_home = '/usr/lib/jvm/java-1.8.0-openjdk'
    }
  }



  # --------------------------------
  # Environnment variables
  # --------------------------------
  $default_env_vars   = []

  # --------------------------------
  # Karaf custom properties.
  # --------------------------------
  $karaf_custom_properties = []

  # --------------------------------
  # Karaf users definition.
  # --------------------------------
  $karaf_users_definition = {
    'karaf' => 'karaf,_g_:admingroup'
  }

  # --------------------------------
  # Karaf system properties.
  # --------------------------------
  $karaf_ssh_host     = '0.0.0.0'
  $karaf_ssh_port     = 8101
  $karaf_ssh_user     = 'karaf'

  # --------------------------------
  # Logging
  # --------------------------------
  $file_karaf_logging  = 'puppet:///modules/karaf/karaf/etc/org.ops4j.pax.logging.cfg'

  # --------------------------------
  # Maven settings
  # --------------------------------
  $file_maven_settings = 'puppet:///modules/karaf/maven/settings.xml'
  $mvn_repositories = [
    'http://repo1.maven.org/maven2@id=central',
    'http://repository.apache.org/content/groups/snapshots-group@id=apache@snapshots@noreleases',
    'https://oss.sonatype.org/content/repositories/snapshots@id=sonatype.snapshots.deploy@snapshots@noreleases',
    'https://oss.sonatype.org/content/repositories/ops4j-snapshots@id=ops4j.sonatype.snapshots.deploy@snapshots@noreleases'
  ]

  # ----------------------------------
  # Karaf Features and repo management.
  # ----------------------------------
  $karaf_additional_repos   = []
  $karaf_startup_feature_repos = []
  $karaf_startup_feature_boots = []

  # ----------------------------------
  # Karaf Rmi.
  # ----------------------------------
  $karaf_rmi_registry_host = '0.0.0.0'
  $karaf_rmi_registry_port = 1099
  $karaf_rmi_server_host = '0.0.0.0'
  $karaf_rmi_server_port = 44444

  # ----------------------------------
  # Karaf configuration files.
  # ----------------------------------
  $karaf_configuration_properties = {
      'org.apache.karaf.shell.cfg' => {
        "sshHost" => $karaf_ssh_host,
        "sshPort" => $karaf_ssh_port
      },
      'org.apache.karaf.management.cfg' => {
        "rmiRegistryPort" => $karaf_rmi_registry_port,
        "rmiRegistryHost" => $karaf_rmi_registry_host,
        "rmiServerPort"   => $karaf_rmi_server_port,
        "rmiServerHost"   => $karaf_rmi_server_host

,      },
      'org.apache.karaf.features.repos.cfg' => $karaf_additional_repos,
      'users.properties' => $karaf_users_definition,
      'custom.properties' => $karaf_custom_properties
  }

}