# PRIVATE CLASS - do not use directly
#
# Karaf logging configuration.
class karaf::configuration::logging inherits karaf {
  file { "${rootdir}/karaf/etc/org.ops4j.pax.logging.cfg":
    ensure  => present,
    source => [
      "puppet:///modules/${caller_module_name}/karaf/etc/org.ops4j.pax.logging.cfg",
      "puppet:///modules/${caller_module_name}/karaf/etc/org.ops4j.pax.logging.cfg.default"
    ],
  }
}