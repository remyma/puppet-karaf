# Karaf

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [The module manages the following](#the-module-manages-the-following)
    * [Setup requirements](#setup-requirements)
    * [Beginning with karaf](#beginning-with-karaf)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

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

Declare the top-level `elasticsearch` class (managing repositories) and set up an instance:

```puppet
class { 'karaf':
}
```

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
