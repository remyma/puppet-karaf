# PRIVATE CLASS - do not use directly
#
# The karaf default configuration settings.
class karaf::params {

  # Default install dir.
  $rootdir            = '/opt'

  # Value could be 'web' or 'file'. Choose if karaf should be installed from web
  # or from file. If file, please provide zip archive in files directory.
  $install_from       = 'web'

  # Default karaf version to install
  $version            = '4.0.8'

  # --------------------------------
  # Service variables.
  # --------------------------------
  $service_name       = 'karaf'
  $service_user_name  = 'karaf'
  $service_user_id    = 3226
  $service_group_name = 'karaf'
  $service_group_id   = 3226

  # --------------------------------
  # Java home
  # --------------------------------
  $java_home            = '/usr/lib/jvm/java-1.8.0-openjdk'

  # --------------------------------
  # Karaf variables.
  # --------------------------------
  $karaf_http_port      = 8181

  # --------------------------------
  # Karaf shell config variables.
  # --------------------------------
  $karaf_ssh_host       = '0.0.0.0'
  $karaf_ssh_port       = 8101
  $karaf_ssh_user       = 'karaf'

  # --------------------------------
  # Karaf Activemq properties.
  # --------------------------------
  $karaf_activemq_name      = 'amq-broker'
  $karaf_activemq_port      = '61616'
  $karaf_activemq_host      = 'localhost'
  $karaf_activemq_user      = 'smx'
  $karaf_activemq_password  = 'smx'

  # ----------------------------------
  # Karaf Features and repo management.
  # ----------------------------------
  $karaf_additional_repos   = []
}