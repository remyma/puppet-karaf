# Karaf

[![Build Status](https://travis-ci.org/remyma/puppet-karaf.svg?branch=master)](https://travis-ci.org/remyma/puppet-karaf)


#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [The module manages the following](#the-module-manages-the-following)
    * [Setup requirements](#setup-requirements)
    * [Beginning with karaf](#beginning-with-karaf)
3. [Usage - Configuration options and additional functionality](#usage)
    * [How to manage multiple karaf instances](#multiple-instances)

## Description

This module sets up Karaf instances.

Current version used by this module is Karaf 4.0.9.

## Setup

### The module manages the following

* Download or copy and extract karaf zip file
* Configure karaf
* Install karaf as a service

### Setup requirements

* puppetlabs-java for Java installation


### Beginning with karaf

Declare the top-level `karaf` class and set up an instance:

```puppet
class { '::karaf': }

karaf::instance { 'instance1':
}
```

## Usage

* Installation, make sure service is running and will be started at boot time :

```puppet
class { '::karaf': }

karaf::instance { 'instance1':
}
```

This will install and configure a service named 'karaf-instance1'.

* You can specify repos to be added on karaf startup, as well as features to start during karaf boot

```puppet
karaf::instance { 'instance1':
   karaf_startup_feature_repos => ['mvn:org.apache.camel.karaf/apache-camel/2.18.1/xml/features'],
   karaf_startup_feature_boots => ['jndi', 'jms', 'camel', 'camel-swagger', 'camel-jms']
}
```

* You can override karaf default logging configuration file by providing your own:

```puppet
karaf::instance { 'instance1':
   file_karaf_logging    => 'puppet:///modules/karaf/karaf/etc/org.ops4j.pax.logging.cfg'
}
```

* If you need to update your maven settings (for instance if karaf needs to retrieve maven dependencies from nexus), you can override maven settings:
      
```puppet
karaf::instance { 'instance1':
   file_maven_settings   => 'puppet:///modules/karaf_is/maven/settings.xml'
}
```

### How to manage multiple karaf instances

```
class { '::karaf': }

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
```