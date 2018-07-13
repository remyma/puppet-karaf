# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::setenv
define karaf::instance::configuration::setenv(
  $serverdir            = undef,
  $java_home            = undef,
  $default_env_vars     = undef,
) {
  ensure_resource(file_line, "${serverdir}-env-JAVA_HOME", {
    path  => "${serverdir}/bin/setenv",
    line  => "export JAVA_HOME = \"${java_home}\"",
    match => '^export JAVA_HOME ='
  })

  each($default_env_vars) |$key, $value| {
    ensure_resource(file_line, "${serverdir}-env-${key}", {
      path  => "${serverdir}/bin/setenv",
      line  => "export ${key}=${value}",
      match => "^export ${key}="
    })
  }
}