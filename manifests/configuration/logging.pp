# PRIVATE CLASS - do not use directly
#
# Karaf logging configuration.
class karaf::configuration::logging inherits karaf {
  file { "${rootdir}/karaf/etc/org.ops4j.pax.logging.cfg":
    ensure  => present,
    source => [
      $file_karaf_logging
    ],
  }
}