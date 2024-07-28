{ pkgs, ... }:

{

  home.packages = with pkgs;
    [
      (writeShellScriptBin "tmux-resurrect-save-hook"
        (builtins.readFile ./scripts/tmux-resurrect-save-hook.sh))
    ];

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
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-strategy-vim 'session'
            set -g @resurrect-processes '~nvim -> nvim'
            set -g @resurrect-hook-post-save-all 'tmux-resurrect-save-hook'
          '';
        }
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
