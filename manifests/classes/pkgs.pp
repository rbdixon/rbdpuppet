$packages = ["emacs", "git", "git-core", "inkscape"]

class pkgs {
  package{$packages:
    ensure => installed
  }
}	
