class flask {

  exec {
    "fabric":
      command => "/usr/bin/sudo pip install Fabric",
      require => Package["python-pip"],
  }

  exec {
    "Flask":
      command => "/usr/bin/sudo pip install Flask",
      require => Package["python-pip"],
  }

  exec {
    "flask-sqlalchemy":
      command => "/usr/bin/sudo pip install Flask-SQLAlchemy",
      require => Package["python-pip"],
  }

  exec {
    "flask-script":
      command => "/usr/bin/sudo pip install Flask-Script",
      require => Package["python-pip"],
  }

  exec {
    "flask-wtforms":
      command => "/usr/bin/sudo pip install Flask-WTF",
      require => Package["python-pip"],
  }

  exec {
    "argparse":
      command => "/usr/bin/sudo pip install argparse",
      require => Package["python-pip"],
  }

  exec {
    "distribute":
      command => "/usr/bin/sudo pip install distribute",
      require => Package["python-pip"],
  }

  exec {
    "pyGeoDB":
      command => "/usr/bin/sudo pip install pyGeoDB",
      require => Package["python-pip"],
  }

  exec {
    "wtforms-recaptcha":
      command => "/usr/bin/sudo pip install wtforms-recaptcha",
      require => Package["python-pip"],
  }

  exec {
    "flup":
      command => "/usr/bin/sudo pip install flup",
      require => Package["python-pip"],
  }

}