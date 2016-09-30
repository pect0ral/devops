class profile::base {
  class { '::ntp': }
  package { 'lsof':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

}

