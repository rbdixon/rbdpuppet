class repos {

  define repo($url, $release, $components) {
    file {"/etc/apt/sources.list.d/$name.list":
      ensure => present,
      content => "deb $url $release $components\n",
      notify => [ Exec["apt-get update $name"], Exec["apt-get $name keyring"] ],
    }

    exec{"apt-get update $name":
      command => "/usr/bin/apt-get -q -q update",
      refreshonly => true,
    }

    exec{"apt-get $name keyring":
      command => "/usr/bin/apt-get -q -q -y --force-yes install $name-keyring",
      refreshonly => true,
      require => [ Exec["apt-get update $name"], File["/etc/apt/sources.list.d/$name.list"] ],
    }
    
  }

  repo{"medibuntu":
    url => "http://packages.medibuntu.org/",
    release => "intrepid",
    components => "free non-free",
  }
  
}
  
