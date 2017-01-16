# Karaf

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [The module manages the following](#the-module-manages-the-following)
    * [Setup requirements](#setup-requirements)
    * [Beginning with karaf](#beginning-with-karaf)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

This module sets up Karaf instances.

This module has been tested on Karaf 4.0.8.

## Setup

### The module manages the following

* Download or copy and extract karaf zip file
* Configure karaf
* Install karaf as a service

### Setup requirements

* puppetlabs-java for Java installation


### Beginning with karaf

Declare the top-level `karaf` class (managing repositories) and set up an instance:

```puppet
class { 'karaf':
}
```

## Usage

* Installation, make sure service is running and will be started at boot time :

```puppet
class { 'karaf':
}
```

* You can specify repos to be added on karaf startup, as well as features to start during karaf boot

```puppet
      class { 'karaf':
           karaf_startup_feature_repos => ['mvn:org.apache.camel.karaf/apache-camel/2.18.1/xml/features'],
           karaf_startup_feature_boots => ['jndi', 'jms', 'camel', 'camel-swagger', 'camel-jms']
       }
```

* You can override karaf default logging configuration file:

```puppet
      class { 'karaf':
           file_karaf_logging    => 'puppet:///modules/karaf_is/karaf/etc/org.ops4j.pax.logging.cfg'
       }
```

* If you need to update your maven settings (for instance if karaf needs to retrieve maven dependencies from nexus), you can override maven settings:
      
```puppet
      class { 'karaf':
           file_maven_settings   => 'puppet:///modules/karaf_is/maven/settings.xml'
       }
```
