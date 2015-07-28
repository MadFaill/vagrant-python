class project {

  exec {
    "transitions":
      command => "/usr/bin/sudo pip install transitions",
      require => Package["python-pip"],
  }

  exec {
    "gevent":
      command => "/usr/bin/sudo pip install gevent",
      require => Package["python-pip"],
  }

  exec {
    "greenlet":
      command => "/usr/bin/sudo pip install greenlet",
      require => Package["python-pip"],
  }

  exec {
    "greenclock":
      command => "/usr/bin/sudo pip install greenclock",
      require => Package["python-pip"],
  }

}