class { '::karaf': }
class { '::java': }

karaf::instance { 'instance1':
}

karaf::instance { 'instance2':
}

## A hash of user resources:
#$myKarafs = {
#  'karaf1' => {
#    karaf_http_port    => '8181',
#    karaf_ssh_port     => '8101',
#    karaf_file_name    => 'karaf1'
#  },
#  'karaf2'  => {
#    karaf_http_port    => '8182',
#    karaf_ssh_port     => '8102',
#    karaf_file_name    => 'karaf2'
#  },
#}
#
#create_resources(karaf::instance, $myKarafs)
