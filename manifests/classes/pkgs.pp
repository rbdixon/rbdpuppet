$packages = ["emacs", "git", "git-core", "inkscape", "skype", "acroread", "pdfjam", "keyjnote"]

import "repos"

class pkgs {

  include repos 

  package{$packages:
    ensure => installed,
  }

}	
