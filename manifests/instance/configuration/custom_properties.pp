# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::custom_properties.
define karaf::instance::configuration::custom_properties(
  $serverdir               = undef,
  $karaf_custom_properties = undef,
) {

  each($karaf_custom_properties) |$key, $value| {
    ensure_resource(file_line, "${serverdir}-$key", {
      path  => "${serverdir}/etc/custom.properties",
      line  => "${key} = ${value}",
      match => "^${key} ="
    })
  }

}