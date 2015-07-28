class uwsgi {

  exec { "python-uwsgi":
      command => "/usr/bin/sudo pip install uwsgi",
      require => Package["python-dev", "python-pip"]
  }

  file { "/etc/uwsgi/":
    ensure => "directory",
    mode   => 666,
  }

  file { "/etc/uwsgi/conf.d/":
    ensure => "directory",
    mode   => 666,
  }

  file { '/etc/uwsgi/conf.d/host.ini':
    source  => 'puppet:///modules/uwsgi/host.ini',
  }

}
