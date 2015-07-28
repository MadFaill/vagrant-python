class mysql {

  package { ['mysql-server']:
    ensure  => present,
    require => Exec['apt-update'],
  }

  service { 'mysql':
    ensure  => running,
    enable => true,
    require => Package['mysql-server'],
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysql'],
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot password root',
    command => 'mysqladmin -uroot password root',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}
