class users {

  define user() {
    file{"/home/$name/.ssh/authorized_keys2":
      ensure => present,
      content => template("users/authorized_keys2.erb"),
    }
  }
  
}
  
