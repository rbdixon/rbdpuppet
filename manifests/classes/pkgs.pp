
import "repos"

class pkgs {

  $packages = ["emacs", "git", "git-core", "inkscape", "skype", "acroread", "pdfjam", "keyjnote", "debconf-utils", "s3cmd"]

  class java6 {
    $seeds = "/var/cache/debconf/java6.seeds"

    file{"$seeds":
      ensure => present,
      content => "sun-java6-bin	shared/accepted-sun-dlj-v1-1	boolean	true
sun-java6-jre	shared/accepted-sun-dlj-v1-1	boolean	true
",
    }

    package{["gcj-4.2-base","libgcj-common", "libgcj8-1", "libgcj8-1-awt", "libgcj8-jar"]:
      ensure => absent,
    }
    
    package{["sun-java6-jre", "sun-java6-plugin"]:
      ensure => present,
      require => [Package[debconf-utils], File[$seeds]],
      responsefile => "$seeds",
    }
  }

  class exchange {
    package{["evolution-exchange", "openchangeclient", "openchangeproxy"]:
      ensure => present,
    }
  }

  class openoffice {
    package{"openoffice.org":
      ensure => latest,
    }
  }
  
  include repos
  include java6
  include exchange
  include openoffice

  package{$packages:
    ensure => installed,
  }

}	
