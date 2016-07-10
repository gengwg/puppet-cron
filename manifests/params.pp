# Author: Weigang Geng

class cron::params {

  $package_name           = 'cronie'
  $service_name             = 'crond'
  $service_hasstatus        = true
  $service_hasrestart       = true
  $service_config_path      = '/etc/sysconfig/crond'
  $service_config_template  = 'cron/crond.sysconfig.erb'

  # To send cron output to syslog, set to 'true'
  $send_to_syslog   = true
  # To send cron output to local mail, set to 'true'
  $send_to_mail     = false

  $crond_args_syslog = $send_to_syslog ? {
    true     => '-s',
    false    => '',
    default  => undef,
  }

  $crond_args_mail = $send_to_mail ? {
    true     => '',
    false    => '-m off',
    default  => undef,
  }

  $crond_args = "${crond_args_syslog} ${crond_args_mail}"

}

