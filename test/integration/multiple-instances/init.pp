class { '::java':
  package => 'java-1.8.0-openjdk-devel',
}

$karaf_instances = {
  'instance1' => {
    karaf_configuration_properties => {
      'org.apache.karaf.shell.cfg'      => {
        "sshPort" => 8101
      },
      'org.apache.karaf.management.cfg' => {
        "rmiRegistryPort" => 1099,
        "rmiServerPort"   => 44444,
      },
    },
  },
  'instance2' => {
    karaf_configuration_properties => {
      'org.apache.karaf.shell.cfg' => {
        "sshPort" => 8102
      },
      'org.apache.karaf.management.cfg' => {
        "rmiRegistryPort" => 1098,
        "rmiServerPort"   => 44445,
      },
    }
  },

}

class { 'karaf':
  instances => $karaf_instances
}
