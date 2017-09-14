class karaf::install inherits karaf {

  # ---------------------------------------------
  # Install dependencies.
  # ---------------------------------------------
  package { 'unzip': ensure => 'installed' }
  package { 'wget': ensure => 'installed' }

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
    file { "/tmp/${karaf_file_name}.zip":
      ensure => present,
      source => "puppet:///modules/${caller_module_name}/karaf/dist/${karaf_file_name}.zip",
      owner   => $service_user_name,
      group   => $service_group_name
    }

    $unzip_require = File[ "${rootdir}/${karaf_file_name}.zip" ]
  } else {
    exec { 'donwload_karaf':
      command => "/usr/bin/wget -q ${karaf_zip_url} -P /tmp/",
      creates  => "/tmp/${karaf_file_name}.zip",
      timeout => 1000
    }

    $unzip_require = Exec['donwload_karaf']
  }

  exec {'unzip karaf package':
    unless  => "/usr/bin/test -d ${rootdir}/${karaf_file_name}",
    cwd     => "/home/${service_user_name}",
    command => "/usr/bin/unzip /tmp/${karaf_file_name}.zip -d ${rootdir}",
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