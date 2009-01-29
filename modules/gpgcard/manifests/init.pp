class gpgcard {
  file{"/dev/cmx0":
    owner => "bdixon",
    group => "bdixon",
  }

  package{["seahorse", "seahorse-plugins"]:
    ensure => absent,
  }

  package{"gnupg-agent":
    ensure => present
  }
}
  
