class supervisor {

  package { 'supervisor':
    ensure  => 'present',
    require => Exec['apt-update'],
  }

  service { 'supervisor':
    enable  => true,
    ensure  => running,
    require => Package['supervisor'],
  }

  file { "/etc/supervisor/":
    ensure => "directory",
    mode   => 666,
  }

  file { "/etc/supervisor/conf.d/":
    ensure => "directory",
    mode   => 666,
  }

  file { '/etc/supervisor/conf.d/host.conf':
    source  => 'puppet:///modules/supervisor/host.conf',
    notify  => Service['supervisor'],
  }

}
