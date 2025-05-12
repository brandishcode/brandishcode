{ pkgs, icons, monitor }:

{
  desktopEnvironment = {
    workspaces = [
      {
        label = icons.terminal;
        inherit (builtins.elemAt monitor 0) output;
        shortcut = 0;
        apps = [ pkgs.foot ];
      }
      {
        label = icons.browser;
        inherit (builtins.elemAt monitor 1) output;
        shortcut = 1;
        apps = [ pkgs.firefox ];
      }
      {
        label = icons.devBrowser;
        inherit (builtins.elemAt monitor 2) output;
        shortcut = 9;
        apps = [ pkgs.chromium ];
      }
    ];
  };
}
