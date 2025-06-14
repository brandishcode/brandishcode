{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh
      export PS1='\[\033[0;32m\][\u@\h \W\[\033[1;36m\]$(__git_ps1 " %s")\[\033[0;32m\]]\$\[\033[0;00m\] '
    '';
    enableCompletion = true;
  };
}
