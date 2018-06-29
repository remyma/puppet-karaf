# PRIVATE CLASS - do not use directly
#
# Definition: karaf::instance::configuration::additional_repos
define karaf::instance::configuration::additional_repos(
  $serverdir                  = undef,
  $karaf_additional_repos     = undef,
) {
  each($karaf_additional_repos) |$key, $value| {
    ensure_resource(file_line, "${serverdir}-repo-$key", {
      path  => "${serverdir}/etc/org.apache.karaf.features.repos.cfg",
      line  => "${key}=${value}",
      match => "^${key}="
    })
  }

}