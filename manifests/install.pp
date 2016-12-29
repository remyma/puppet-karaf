class karaf::install inherits karaf {

  # ---------------------------------------------
  # Install dependencies.
  # ---------------------------------------------
  package { 'unzip':
    ensure => 'installed',
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
  if ($install_from == 'file') {
    file { "/${rootdir}/${karaf_file_name}.zip":
      ensure => present,
      source => "puppet:///modules/karaf/${karaf_file_name}.zip"
    }

    $unzip_require = File[ "${rootdir}/${karaf_file_name}.zip" ]
  } elsif ($install_from == 'web') {
    exec { 'donwload_karaf':
      command => "/usr/bin/wget -q ${karaf_zip_url} -P ${rootdir}/",
      creates  => "${rootdir}/${karaf_file_name}.zip",
      timeout => 1000
    }

    $unzip_require = Exec['donwload_karaf']
  }

  exec {'unzip karaf package':
    unless  => "/usr/bin/test -d ${rootdir}/${karaf_file_name}",
    cwd     => "/home/${service_user_name}",
    command => "/usr/bin/unzip ${rootdir}/${karaf_file_name}.zip -d ${rootdir}",
    require => [ $unzip_require ]
  }

  file { "${rootdir}/${karaf_file_name}/":
    owner   => $service_user_name,
    group   => $service_group_name,
    recurse => true
  }

  file { "${rootdir}/karaf":
    ensure  => 'link',
    target  => "${rootdir}/${karaf_file_name}/",
    owner   => $service_user_name,
    group   => $service_group_name,
  }
}