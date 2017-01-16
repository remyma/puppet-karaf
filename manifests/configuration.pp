class karaf::configuration inherits karaf {
  include karaf::configuration::maven
  include karaf::configuration::custom_properties
  include karaf::configuration::setenv
  include karaf::configuration::shell
  include karaf::configuration::system
  include karaf::configuration::features
  include karaf::configuration::logging
}