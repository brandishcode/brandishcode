{
  programs.bash = {
    enable = true;
    initExtra = ''
      export PS1='\033[1;32m\]$(whoami):''${PWD/*\//}# \033[00m\]'
    '';
    enableCompletion = true;
  };
}
