
class sql {
  
  exec { "apt-update-repo":
    command => "/usr/bin/apt-get -y update"
  }

  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev", "redis-server", "postgresql", "postgresql-client"]: 
      ensure => installed, 
      require => Exec['apt-update']
  }
  
  service { "mysql":
    ensure    => running,
    enable    => true,
    require => Package["mysql-server"],  
  }

  service { "redis-server":
    ensure    => running,
    enable    => true,
    require => Package["redis-server"],  
  }

  service { "postgresql-8.4":
    ensure    => running,
    enable    => true,
    require => Package["postgresql"],  
  }
  
}



