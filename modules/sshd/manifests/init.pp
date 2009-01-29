class sshd {

  package{["openssh-client", "openssh-server"]:
    ensure => present,
  }
  
  file{"/etc/ssh/ssh_config":
    ensure => present,
    content => template("sshd/ssh_config.erb"),
  }

  file{"/etc/ssh/sshd_config":
    ensure => present,
    content => template("sshd/sshd_config.erb"),
  }
}

