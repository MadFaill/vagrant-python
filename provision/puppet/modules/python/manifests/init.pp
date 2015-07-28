import "pythondev"
import "flask"
import "project"

class python {

    package {
      [ "python", "python-setuptools", "python-dev", "python-pip",
        "python-matplotlib", "python-imaging", "python-numpy", "python-scipy",
        "python-software-properties", "idle", "python-qt4", "python-wxgtk2.8" ]:
        ensure => ["installed"],
        require => Exec['apt-update']
    }

    exec {
      "virtualenv":
      command => "/usr/bin/sudo pip install virtualenv",
      require => Package["python-dev", "python-pip"]
    }

}