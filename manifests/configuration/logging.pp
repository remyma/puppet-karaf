# PRIVATE CLASS - do not use directly
#
# Karaf logging configuration.
class karaf::configuration::logging inherits karaf {
  file { "${rootdir}/karaf/etc/org.ops4j.pax.logging.cfg":
    ensure  => present,
    source => [
      "puppet:///modules/karaf/karaf/etc/org.ops4j.pax.logging.cfg",
      "puppet:///modules/karaf/karaf/etc/org.ops4j.pax.logging.cfg.default"
    ],
  }
}