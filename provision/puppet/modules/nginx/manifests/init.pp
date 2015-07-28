class nginx {

  package { 'nginx':
    ensure  => 'present',
    require => Exec['apt-update'],
  }

  service { 'nginx':
    ensure  => running,
    enable => true,
    require => Package['nginx'],
  }


# Disable default nginx vhost
  file { 'default-nginx-disable':
    path    => '/etc/nginx/sites-enabled/default',
    ensure  => absent,
    require => Package['nginx'],
  }

  file { '/etc/nginx/sites-enabled/host':
    source  => 'puppet:///modules/nginx/host.conf',
    notify  => Service['nginx'],
  }

}
