class repos {

  define repo($url, $release, $components) {
    file {"/etc/apt/sources.list.d/$name.list":
      ensure => present,
      content => "deb $url $release $components\n",
      notify => Exec["apt-get update $name"],
    }

    exec{"apt-get update $name":
      command => "/usr/bin/apt-get -q -q update",
      refreshonly => true,
    }

  }

  define apt-key($fp) {
    exec{"/usr/bin/apt-key adv --recv-keys --keyserver keyserver.ubuntu.com $fp":
      unless => "/usr/bin/apt-key list|grep $fp",
    }
  }

  apt-key{"Medibuntu":
    fp => "0C5A2783",
  }
  
  repo{"medibuntu":
    url => "http://packages.medibuntu.org/",
    release => "intrepid",
    components => "free non-free",
    require => Apt-key["Medibuntu"],
  }

  apt-key{"OpenOffice.org":
    fp => "247D1CFF",
  }
  
  repo{"ooo3":
    url => "http://ppa.launchpad.net/openoffice-pkgs/ubuntu",
    release => "intrepid",
    components => "main",
    require => Apt-key["OpenOffice.org"],
  }
}
  
