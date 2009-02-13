import "classes/*.pp"
import "mail"
import "gpgcard"
import "sshd"
import "personal.pp"
import "users"

node default {
  include pkgs
  include mail
  include gpgcard
  include sshd
  include users

  users::user{"bdixon": }
}

