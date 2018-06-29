# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::users_definition.
define karaf::instance::configuration::users_definition(
  $serverdir               = undef,
  $karaf_users_definition  = undef,
) {
  each($karaf_users_definition) |$key, $value| {
    ensure_resource(file_line, "${serverdir}-user-$key", {
      path  => "${serverdir}/etc/users.properties",
      line  => "${key} = ${value}",
      match => "^${key} ="
    })
  }
}