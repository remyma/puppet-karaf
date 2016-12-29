# PRIVATE CLASS - do not use directly
#
# Karaf shell configuration.
class karaf::configuration::shell inherits karaf {
  file { "${rootdir}/karaf/etc/org.apache.karaf.shell.cfg":
    ensure  => file,
    content => template("karaf/karaf/etc/org.apache.karaf.shell.cfg.erb"),
  }
}