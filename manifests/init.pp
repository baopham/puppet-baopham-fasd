# == Class: fasd
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
class fasd {
  if(!defined(Package['git'])) {
    package { 'git':
      ensure => present,
    }
  }
}
