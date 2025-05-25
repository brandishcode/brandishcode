{ pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    package = pkgs.ranger.overrideAttrs (old: {
      src = fetchGit {
        url = "https://github.com/ranger/ranger";
        rev = "b31db0f638118c103a35be5a57d1a0f3609838d6";
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
