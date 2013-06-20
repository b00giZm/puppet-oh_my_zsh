# Public: Installs oh-my-zsh via using git.
#
# Examples
#
#   include oh-my-zsh

class oh_my_zsh {
  include zsh

  $user_home = "/Users/${::luser}"
  $dest_dir  = "${user_home}/.oh-my-zsh"
  
  repository { $dest_dir:
    source  => 'robbyrussell/oh-my-zsh',
    provider => 'git',
  }
  
  exec { 'backup_zshrc_oh_my_zsh':
    command   => "cat ${user_home}/.zshrc > ${user_home}/.zshrc.pre-oh-my-zsh",
    onlyif    => "test -f ${user_home}/.zshrc",
    subscribe => Repository[$dest_dir],
  }
  
  exec { 'copy_zshrc_config_template':
    command   => "cp ${dest_dir}/templates/zshrc.zsh-template ${user_home}/.zshrc",
    subscribe => Exec['backup_zshrc_oh_my_zsh']
  }

}