# Class: karaf
# ===========================
#
# Full description of class karaf here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'karaf':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <remy.matthieu@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Matthieu Rémy.
#
class karaf(
  $version                  = $karaf::params::version,
  $rootdir                  = $karaf::params::rootdir,
  $install_from             = $karaf::params::install_from,
  $service_user_name        = $karaf::params::service_user_name,
  $service_group_name       = $karaf::params::service_group_name,
  $java_home                = $karaf::params::java_home,
  $karaf_ssh_host           = $karaf::params::karaf_ssh_host,
  $karaf_ssh_port           = $karaf::params::karaf_ssh_port,
  $karaf_ssh_user           = $karaf::params::karaf_ssh_user,
  $karaf_activemq_name      = $karaf::params::karaf_activemq_name,
  $karaf_activemq_port      = $karaf::params::karaf_activemq_port,
  $karaf_activemq_host      = $karaf::params::karaf_activemq_host,
  $karaf_activemq_user      = $karaf::params::karaf_activemq_user,
  $karaf_activemq_password  = $karaf::params::karaf_activemq_password,
) inherits karaf::params {
  include karaf::install
  include karaf::configuration
  include karaf::service
}
