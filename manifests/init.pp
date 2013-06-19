# Public: Installs oh-my-zsh via the automatic installer script.
#
# Examples
#
#   include oh-my-zsh
class oh_my_zsh {
  exec { 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | /bin/sh':
    path => '/usr/bin',
  }
}