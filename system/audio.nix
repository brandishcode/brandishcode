{ pkgs, config, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      cdrtools
      alsa-utils
      pulseaudio
    ];
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    services.mpd = {
      enable = true;
      musicDirectory = config.musicDirectory;
      network.listenAddress = "any";
      user = "developer";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My pipewire output"
        }
      '';
    };
    systemd.services.mpd.environment = {
      # must match the services.mpd.user UID
      XDG_RUNTIME_DIR = "/run/user/1000";
    };
  };
}
