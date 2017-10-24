# Karaf

[![Build Status](https://travis-ci.org/remyma/puppet-karaf.svg?branch=master)](https://travis-ci.org/remyma/puppet-karaf)
[![Puppet Forge Version](https://img.shields.io/puppetforge/v/remyma/karaf.svg)](https://forge.puppetlabs.com/remyma/karaf)


#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [The module manages the following](#the-module-manages-the-following)
    * [Setup requirements](#setup-requirements)
    * [Beginning with karaf](#beginning-with-karaf)
3. [Usage - Configuration options and additional functionality](#usage)
    * [How to manage multiple karaf instances](#how-to-manage-multiple-karaf-instances)
    * [How to remove a karaf instance](#how-to-remove-a-karaf-instance)
4. [Reference](#reference)
    * [Parameters](#parameters)
        * [version](#version)
        * [rootdir](#rootdir)
        * [install_from](#installfrom)
        * [karaf_file_name](#karaffilename)
        * [karaf_zip_url](#karafzipurl)
        * [service_user_name](#serviceusername)
        * [service_user_id](#serviceuserid)
        * [service_group_name](#servicegroupname)
        * [service_group_id](#servicegroupid)
        * [java_home](#javahome)
        * [default_env_vars](#defaultenvvars)
        * [karaf_ssh_host](#karafsshhost)
        * [karaf_ssh_port](#karafsshport)
        * [karaf_ssh_user](#karafsshuser)
        * [karaf_custom_properties](#karafcustomproperties)
        * [karaf_startup_feature_repos](#karafstartupfeaturerepos)
        * [karaf_startup_feature_boots](#karafstartupfeatureboots)
        * [mvn_repositories](#mvnrepositories)
        * [file_maven_settings](#filemavensettings)
        * [file_karaf_logging](#filekaraflogging)


## Description

This module sets up Karaf instances.

Current version used by this module is Karaf 4.0.10.

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
class { 'karaf':
}
```

## Usage

* Installation, make sure service is running and will be started at boot time :

```puppet
class { 'karaf':
}
```

This will install and configure a service named 'karaf'.

* You can specify repos to be added on karaf startup, as well as features to start during karaf boot

```puppet
class { 'karaf':
   karaf_startup_feature_repos => ['mvn:org.apache.camel.karaf/apache-camel/2.18.1/xml/features'],
   karaf_startup_feature_boots => ['jndi', 'jms', 'camel', 'camel-swagger', 'camel-jms']
}
```

* You can override karaf default logging configuration file by providing your own:

```puppet
class { 'karaf':
   file_karaf_logging    => 'puppet:///modules/karaf/karaf/etc/org.ops4j.pax.logging.cfg'
}
```

* If you need to update your maven settings (for instance if karaf needs to retrieve maven dependencies from nexus), you can override maven settings:
      
```puppet
class { 'karaf':
   file_maven_settings   => 'puppet:///modules/karaf_is/maven/settings.xml'
}
```

### How to manage multiple karaf instances

```puppet
$karaf_instances = {
  'instance1' => {
    karaf_ssh_port          => 8101,
    karaf_rmi_registry_port => 1099,
    karaf_rmi_server_port   => 44444,
  },
  'instance2'  => {
    karaf_ssh_port          => 8102,
    karaf_rmi_registry_port => 1098,
    karaf_rmi_server_port   => 44445,
  },
}

class { 'karaf':
  instances => $karaf_instances
}

```

### How to remove a karaf instance

```
$karaf_instances = {
  'instance1' => {
    ensure  => absent
  }
}

class { 'karaf':
  instances => $karaf_instances
}
```


## Reference

### Parameters

All parameters are optional.

#### version

 String. Directory path where kara will be installed.

#### rootdir

 String. Karaf version to install (eg. 4.0.10).

#### install_from

 String. 'web' or 'file'. If web, zip package is retrieved from url.
 If not, zip package has to be provided in module files/karaf/dist directory.


#### karaf_file_name

 String. name of karaf directory when unzipped.

#### karaf_zip_url

 String. Url of karaf zip. Used id `install_from` web

#### service_user_name

 String. User name of user to run karaf

#### service_user_id

 String. User id of user to run karaf

#### service_group_name

 String. Group name of user to run karaf

#### service_group_id

 String. Group id of user to run karaf

#### java_home

 String. java home

#### default_env_vars

 Array. Environment variables used in setenv.sh file.
 Example :
 default_env_vars      => {
    'JAVA_MIN_MEM'  => '256M'
 }

#### karaf_ssh_host

 String. ssh host to connect to karaf console.

#### karaf_ssh_port

 String. ssh port to connect to karaf console.

#### karaf_ssh_user

 String. ssh user to connect to karaf console.

#### karaf_custom_properties

 Array. custom properties to extand karaf properties in etc/custom.properties file.


#### karaf_startup_feature_repos

 Array. List of repos to declare at karaf startup.

#### karaf_startup_feature_boots

 Array. List of features to automatically start on karf boot.

#### mvn_repositories

 String. Maven repositories to override the ones in ${karaf.home}/etc/org.ops4j.pax.url.mvn.cfg file
 under org.ops4j.pax.url.mvn.repositories property.

#### file_maven_settings

 String. Path of file to override maven settings.

#### file_karaf_logging

 String. Path of file to override karaf logging.