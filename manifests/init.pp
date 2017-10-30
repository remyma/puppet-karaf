# Class: karaf
# ===========================
#
# This class is able to install and configure a karaf instance as a service on a node.
#
# Parameters
# ----------
#
# * `instances` [Hash]
#   Define instances via a hash.
#
# * `ensure` [String]
#   Controls if the managed resources shall be `present` or `absent`.
#   If set to `absent`, the managed software packages will be uninstalled, and
#   any traces of the packages will be purged as well as possible, possibly
#   including existing configuration files.
#   System modifications (if any) will be reverted as well as possible (e.g.
#   removal of created users, services, changed log settings, and so on).
#   This is a destructive parameter and should be used with care.
#
# * `version`
# String. Directory path where kara will be installed.
#
# * `rootdir`
# String. Karaf version to install (eg. 4.0.10).
#
# * `install_from`
# String. 'web' or 'file'. If web, zip package is retrieved from url.
# If not, zip package has to be provided in module files/karaf/dist directory.
#
# * `karaf_file_name`
# String. name of karaf directory when unzipped.
#
# * `karaf_zip_url`
# String. Url of karaf zip. Used id `install_from` web
#
# * `service_user_name`
# String. User name of user to run karaf
#
# * `service_user_id`
# String. User id of user to run karaf
#
# * `service_group_name`
# String. Group name of user to run karaf
#
# * `service_group_id`
# String. Group id of user to run karaf
#
# * `java_home`
# String. java home
#
# * `default_env_vars`
# Array. Environment variables used in setenv.sh file.
# Example :
# default_env_vars      => {
#    'JAVA_MIN_MEM'  => '256M'
# }
#
# * `karaf_ssh_host`
# String. ssh host to connect to karaf console.
#
# * `karaf_ssh_port`
# String. ssh port to connect to karaf console.
#
# * `karaf_ssh_user`
# String. ssh user to connect to karaf console.
#
# * `karaf_custom_properties`
# Array. custom properties to extand karaf properties in etc/custom.properties file.
#
# * `karaf_startup_feature_repos`
# Array. List of repos to declare at karaf startup.
#
# * `karaf_startup_feature_boots`
# Array. List of features to automatically start on karf boot.
#
# * `mvn_repositories`
# String. Maven repositories to override the ones in ${karaf.home}/etc/org.ops4j.pax.url.mvn.cfg file
# under org.ops4j.pax.url.mvn.repositories property.
#
# * `file_maven_settings`
# String. Path of file to override maven settings.
#
# * `file_karaf_logging`
# String. Path of file to override karaf logging.
#
# Examples
# --------
#
# * Installation, make sure service is running and will be started at boot time :
#       class { '::karaf': }
#       class { '::java': }
#       karaf::instance { 'instance1':
#       }
#
# * Installation, with startup repos and features
#      karaf::instance { 'instance1':
#         karaf_startup_feature_repos => ['mvn:org.apache.camel.karaf/apache-camel/2.18.1/xml/features'],
#         karaf_startup_feature_boots => ['jndi', 'jms', 'camel', 'camel-swagger', 'camel-jms']
#      }
#
# * Installation, override logging configuration:
#      karaf::instance { 'instance1':
#           file_karaf_logging    => 'puppet:///modules/karaf_is/karaf/etc/org.ops4j.pax.logging.cfg'
#      }
#
# * Installation, override maven settings:
#      karaf::instance { 'instance1':
#           file_maven_settings   => 'puppet:///modules/karaf_is/maven/settings.xml'
#      }
#
# * Uninstallation
#     class { 'karaf':
#       ensure => 'absent',
#     }
#
# Authors
# -------
#
# Matthieu Rémy <remy.matthieu@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Matthieu Rémy.
#
class karaf(
  $instances                    = undef,
  $ensure                       = 'present',
  $version                      = $karaf::params::version,
  $rootdir                      = $karaf::params::rootdir,
  $install_from                 = $karaf::params::install_from,
  $karaf_file_name              = $karaf::params::karaf_file_name,
  $karaf_zip_url                = $karaf::params::karaf_zip_url,
  $service_user_name            = $karaf::params::service_user_name,
  $service_user_id              = $karaf::params::service_user_id,
  $service_group_name           = $karaf::params::service_group_name,
  $service_group_id             = $karaf::params::service_group_id,
  $java_home                    = $karaf::params::java_home,
  $default_env_vars             = $karaf::params::default_env_vars,
  $karaf_ssh_host               = $karaf::params::karaf_ssh_host,
  $karaf_ssh_port               = $karaf::params::karaf_ssh_port,
  $karaf_ssh_user               = $karaf::params::karaf_ssh_user,
  $karaf_custom_properties      = $karaf::params::karaf_custom_properties,
  $karaf_startup_feature_repos  = $karaf::params::karaf_startup_feature_repos,
  $karaf_startup_feature_boots  = $karaf::params::karaf_startup_feature_boots,
  $mvn_repositories             = $karaf::params::mvn_repositories,
  $file_maven_settings          = $karaf::params::file_maven_settings,
  $file_karaf_logging           = $karaf::params::file_karaf_logging,
) inherits karaf::params {

  #  If multiple instances
  if ($instances) {
    create_resources(karaf::instance, $instances)
  } else {
    karaf::instance { 'karaf':
    }
  }

}
