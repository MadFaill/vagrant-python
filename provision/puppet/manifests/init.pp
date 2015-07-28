class core {

    exec { "apt-update":
      command => "/usr/bin/sudo apt-get -y update"
    }

    package {
      [ "vim", "git-core", "build-essential" ]:
        ensure => ["installed"],
        require => Exec['apt-update']
    }
}

class networking {
    package {
      [ "snmp", "tkmib", "curl", "wget" ]:
        ensure => ["installed"],
        require => Exec['apt-update']
    }

}


include core
include nginx
include python
include project
include pythondev
include flask
include networking
include mysql
include mongodb
include uwsgi
include supervisor