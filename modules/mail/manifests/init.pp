class mail {
  package{["mutt", "ssmtp", "mailutils"]:
    ensure => installed
  }

  package{"sendmail":
    ensure => absent
  }

  file{"/etc/ssmtp/revaliases":
    ensure => present,
    content => template("mail/revaliases.erb"),
    require => Package[ssmtp],
  }

  file{"/etc/ssmtp/ssmtp.conf":
    ensure => present,
    content => template("mail/ssmtp.conf.erb"),
    require => Package[ssmtp],
  }
  
}
