class karaf::configuration::logging inherits karaf {
  file { "${rootdir}/karaf/etc/org.ops4j.pax.logging.cfg":
    ensure  => file,
    content => template("karaf/karaf/etc/org.ops4j.pax.logging.cfg.erb"),
  }
}