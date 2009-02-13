class sshd {

  package{["openssh-client", "openssh-server", "denyhosts"]:
    ensure => present,
  }

  service{["ssh", "denyhosts"]:
    ensure => running,
    require => [Package[openssh-server], Package[denyhosts]],
  }
  
  file{"/etc/ssh/ssh_config":
    ensure => present,
    content => template("sshd/ssh_config.erb"),
    notify => Service[ssh],
  }

  file{"/etc/ssh/sshd_config":
    ensure => present,
    content => template("sshd/sshd_config.erb"),
    notify => Service[ssh],
  }
}

