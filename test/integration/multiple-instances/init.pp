class { '::karaf': }
class { '::java': }

karaf::instance { 'instance1':
  karaf_ssh_port          => 8101,
  karaf_rmi_registry_port => 1099,
  karaf_rmi_server_port   => 44444,
}

karaf::instance { 'instance2':
  karaf_ssh_port          => 8102,
  karaf_rmi_registry_port => 1098,
  karaf_rmi_server_port   => 44445,
}
