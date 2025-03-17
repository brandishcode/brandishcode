{ pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      bashrcExtra = ''
        if [ -x "$(command -v tmux)" ] && [ -n "$WAYLAND_DISPLAY" ] && [ -z "$TMUX" ]; then
          exec tmux new-session -A -s $USER >/dev/null 2>&1
        fi
      '';
    };
    tmux = {
      enable = true;
      terminal = "tmux-256color";
      keyMode = "vi";
      extraConfig = ''
        set -s copy-command 'wl-copy'
      '';
      plugins = with pkgs; [
        { plugin = tmuxPlugins.resurrect; }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
          '';
        }
      ];
    };
  };
}
