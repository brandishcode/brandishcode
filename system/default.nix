# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, config, ... }:

{

  # Include the results of the hardware scan.
  # Include home-manager
  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    ./security.nix
  ];

  config = {
    # Bootloader.
    boot.loader.systemd-boot = {
      enable = true;
      # extraEntries = config.systemd-boot-entry1;
    };
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = config.hostname; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking = {
      interfaces.enp3s0 = {
        ipv4.addresses = [
          {
            address = "172.22.1.120";
            prefixLength = 21;
          }
        ];
      };
      defaultGateway = {
        address = "172.22.0.1";
        interface = "enp3s0";
      };
      nameservers = [ "8.8.8.8" ];
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Asia/Tokyo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    users.mutableUsers = false;
    users.groups = {
      development = { };
    };
    users.users.${config.user.username} = {
      isNormalUser = true;
      description = "Developer user";
      extraGroups = [
        "development"
        "networkmanager"
        "wheel"
        "dialout"
        "audio"
      ];
      hashedPasswordFile = config.sops.secrets."users/${config.user.username}".path;
    };

    # key mapping
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "henkan";
            };
          };
        };
      };
    };

    environment.variables = {
      # GTK_IM_MODULE = "fcitx";
      # QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      GLFW_IM_MODULE = "fcitx";
      XDG_CURRENT_DESKTOP = "sway";
    };

    services.xserver.desktopManager.runXdgAutostartIfNone = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    # environment.systemPackages = with pkgs; [ ];
    environment.shellAliases = {
      nrb = ''
        sudo nixos-rebuild switch --flake "path:$(readlink -f /home/${config.user.username}/${config.configpath}/#${config.user.username})"
      '';
    };
    services.udev.packages = with pkgs; [
      vial
      via
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

    # enable flakes
    nix.settings.bash-prompt-prefix = "\\[\\033[43m\\]\\[\\033[1;30m\\](nix-develop)";
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    services.openssh = {
      enable = true;
    };
  };
}
