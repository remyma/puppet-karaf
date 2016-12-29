class karaf::configuration inherits servicemix {
  include karaf::configuration::shell
  include karaf::configuration::system
  include karaf::configuration::logging
}