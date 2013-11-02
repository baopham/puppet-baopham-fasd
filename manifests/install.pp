# == Class: fasd::install
#
# This is the fasd module. Fasd offers quick access to files and directories for POSIX shells
#
# === Parameters
#
# None.
#
# === Examples
#
# class { 'fasd': }
# fasd::install { 'username': }
#
#
define fasd::install() {
  exec { 'fasd::git clone':
    creates => "/home/${name}/fasd",
    command => "/usr/bin/git clone git://github.com/clvv/fasd.git /home/${name}/fasd",
    user    => $name,
    require => [Package['git']]
  }

  exec { 'fasd::make install':
    cwd   => "/home/${name}/fasd",
    command => "make install",
    user    => $name,
    require => Exec["fasd::git clone"],
  }

  notify { 'Please put ```eval "$(fasd --init auto)"``` in your .bashrc or .zshrc':
    require => Exec['fasd::make install']
  }

}
