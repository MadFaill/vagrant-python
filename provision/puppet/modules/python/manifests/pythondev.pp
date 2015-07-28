class pythondev {
    package {
        [ "dpkg-dev", "swig", "python2.7-dev", "libwebkitgtk-dev", "libjpeg-dev", "libtiff4-dev",
        "checkinstall", "ubuntu-restricted-extras", "freeglut3", "freeglut3-dev", "libgtk2.0-dev", "libsdl1.2-dev",
        "libgstreamer-plugins-base0.10-dev" ]:
        ensure => ["installed"],
        require => Exec['apt-update']
    }

    exec {
      "SquareMap":
      command => "/usr/bin/sudo pip install SquareMap",
      require => Package["python-dev", "python-pip"]
    }

    exec {
      "RunSnakeRun":
      command => "/usr/bin/sudo pip install RunSnakeRun",
      require => Package["python-dev", "python-pip"]
    }

#    exec {
#      "wx-from-source":
#      cwd => "/tmp",
#      command => "/usr/bin/apt-get source -d wxwidgets2.8 && /usr/bin/dpkg-source -x wxwidgets2.8_2.8.12.1-6ubuntu2.dsc",
#      #creates => "/tmp/wxwidgets2.8-2.8.12.1/wxPython",
#      creates => '/usr/local/lib/python2.7/dist-packages/wx/lib/__init__.pyc',
#      path => "/bin:/usr/bin:/usr/local/bin",
#
#      require => [Exec['apt-update'], Package["python-dev", "python-pip", "dpkg-dev"]]
#    }

#    exec {
#      "compile-wx-from-source":
#      cwd => "/tmp/wxwidgets2.8-2.8.12.1/wxPython",
#      command => "/usr/bin/sudo python setup.py install",
#      creates => '/usr/local/lib/python2.7/dist-packages/wx/lib/__init__.pyc',
#      path => '/bin:/usr/bin:/usr/local/bin',
#
#      require => Exec['wx-from-source']
#    }
}