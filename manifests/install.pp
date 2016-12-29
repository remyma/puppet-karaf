class karaf::install inherits karaf {

  # ---------------------------------------------
  # Install dependencies.
  # ---------------------------------------------
  package { 'unzip':
    ensure => 'installed',
    #require => Class['iass_spacewalk']
  }

  # ---------------------------------------------
  # Create group and user for karaf service.
  # ---------------------------------------------
  group { $service_group_name:
    ensure => present,
    gid    => $service_group_id,
  }

  user { $service_user_name:
    ensure           => present,
    uid              => $service_user_id,
    gid              => $service_group_id,
    managehome       => true,
    shell            => '/bin/bash',
    require          => Group[$service_group_name]
  }

  # ---------------------------------------------
  # Deploy karaf zip package.
  # ---------------------------------------------
  $karaf_filename = "apache-karaf-${version}"
  if ($install_from == 'file') {
    file { "/tmp/${karaf_filename}.zip":
      ensure => present,
      source => "puppet:///modules/karaf/${karaf_filename}.zip"
    }

    $unzip_require = File[ "/tmp/${karaf_filename}.zip" ]
  } elsif ($install_from == 'web') {
    require iaas_spacewalk
    $url = "${::iaas_spacewalk::params::cdn}/karaf/${karaf_filename}.zip"

    #$url = "http://apache.crihan.fr/dist/karaf/karaf-6/6.1.3/apache-karaf-6.1.3.zip"

    exec { 'retrieve_karaf':
      command => "/usr/bin/wget -q ${url} -P /tmp/",
      unless  => "/usr/bin/test -f /tmp/${karaf_filename}.zip",
      timeout => 1000
    }

    $unzip_require = Exec['retrieve_karaf']
  }

  exec {'unzip karaf package':
    unless  => "/usr/bin/test -d ${rootdir}/${karaf_filename}",
    cwd     => "/home/${service_user_name}",
    command => "/usr/bin/unzip /tmp/${karaf_filename}.zip -d ${rootdir}",
    require => [ $unzip_require, Package['unzip'] ]
  }

  file { "${rootdir}/${karaf_filename}/":
    owner   => $service_user_name,
    group   => $service_group_name,
    recurse => true
  }

  file { "${rootdir}/karaf":
    ensure  => 'link',
    target  => "${rootdir}/${karaf_filename}/",
    owner   => $service_user_name,
    group   => $service_group_name,
  }
}