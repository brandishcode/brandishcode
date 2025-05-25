{ pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    package = pkgs.ranger.overrideAttrs (old: {
      src = pkgs.fetchFromGitHub {
        owner = "ranger";
        repo = "ranger";
        # url = "https://github.com/ranger/ranger";
        rev = "b00f923911090204139c9e19ba42e9d80aa0889f";
        hash = "sha256-ksWlopkqD/98hwVspIRIEGCN/L/OuVlVyXftfza4LhI=";
      };

      preConfigure = old.preConfigure + ''
        substituteInPlace ranger/data/scope.sh \
          --replace "# video/*)" "video/*)" \
          --replace "#     # Get frame 10% into video" "    # Get frame 10% into video" \
          --replace "#     ffmpegthumbnailer -i \"\''${FILE_PATH}\" -o \"\''${IMAGE_CACHE_PATH}\" -s 0 && exit 6" \
              '    ffmpegthumbnailer -i "''${FILE_PATH}" -o "''${IMAGE_CACHE_PATH}" -s 0 && exit 6
                    exit 1;;'
      '';
    });
    extraConfig = ''
      set preview_images_method sixel
      set use_preview_script true
    '';
    extraPackages = with pkgs; [ ffmpegthumbnailer ];
  };
}
