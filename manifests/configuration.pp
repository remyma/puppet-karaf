class karaf::configuration inherits karaf {
  include karaf::configuration::maven
  include karaf::configuration::shell
  include karaf::configuration::system
  include karaf::configuration::logging
}