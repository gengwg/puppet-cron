# Class: cron
#
# This class wraps *cron::instalL* for ease of use
#
# Parameters:
#   package_ensure - Can be set to a package version, 'latest', 'installed' or 'present'.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   include 'cron'
#   class { 'cron': }

class cron (
  $package_ensure = 'installed'
  $service_config_path      = $cron::params::service_config_path,
  $service_config_template  = $cron::params::service_config_template,
  $cron_allow               = [],
  $cron_deny                = [],
  $send_to_syslog = $cron::params::send_to_syslog,
  $send_to_mail = $cron::params::send_to_mail,

) {
  class { '::cron::install': package_ensure => $package_ensure }

  file { '/etc/sysconfig/crond':
    ensure  => present,
    path    => $service_config_path,
    content => template($service_config_template),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}

