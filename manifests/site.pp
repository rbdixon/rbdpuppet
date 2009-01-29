import "classes/*.pp"
import "mail"
import "gpgcard"
import "sshd"
import "personal.pp"

node default {
  include pkgs
  include mail
  include gpgcard
  include sshd
}

