{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh
      BASE_PROMPT='\[\033[0;32m\][\u@\h \W]\$\[\033[1;36m\]$(__git_ps1 " %s")\[\033[0;00m\] '
      export PS1=$BASE_PROMPT

      if [[ "$IN_NIX_SHELL" == "impure" || "$IN_NIX_SHELL" == "pure" ]]; then
        export PS1='\[\033[41m\]\[\033[1;30m\](nix-shell#$IN_NIX_SHELL)'$BASE_PROMPT
      fi
    '';
    enableCompletion = true;
  };
}
