{ lib }:
let helperErrorMessages = (import ../../helpers/error-messages);
in with helperErrorMessages; {
  iconType = lib.mkOptionType rec {
    name = "icon-type";
    description = ''
      Icon character.
    '';
    check = x:
      assert lib.assertMsg (lib.isString x) (errorMessage name "string");
      true;
  };

  wallpaperType = lib.mkOptionType rec {
    name = "monitor-wallpaper";
    description = "Path to your wallpaper";
    check = x:
      assert lib.assertMsg (lib.isPath x) (errorMessageType name "path");
      true;
  };
}
