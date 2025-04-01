{ lib }:
let
  helpersErrorMessages = (import ../../../helpers/error-messages { });
  themeTypes = (import ./theme-types.nix { inherit lib; });
in with helpersErrorMessages;
with themeTypes; rec {
  monitorOutputPortType = lib.mkOptionType rec {
    name = "monitor-output-port";
    description = ''
      The output port used, example: DP, HDMI, etc.
    '';
    check = x:
      assert lib.assertMsg (lib.isString x) (errorMessageType name "string");
      true;
  };

  monitorPositionType = lib.mkOptionType rec {
    name = "monitor-position";
    description =
      "Monitor x and y coordinates, origin (0,0) is at top left corner";
    check = x:
      assert lib.assertMsg (lib.hasAttr "x" x)
        (errorMessageAttrMissing name "x");
      assert lib.assertMsg (lib.hasAttr "y" x)
        (errorMessageAttrMissing name "y");
      assert lib.assertMsg (lib.isInt x.x)
        (errorMessageAttrType name "x" "int");
      assert lib.assertMsg (lib.isInt x.y)
        (errorMessageAttrType name "y" "int");
      true;
  };

  monitorWallpaperType = wallpaperType;
  monitorType = lib.mkOptionType rec {
    name = "monitor";
    description = ''
      Monitor properties:
      - wallpaper (path to the wallpaper file, jpg, png)
      - position (set with x and y integer attributes)
      - output (DP-1, HDMI-A-1, etc)
    '';
    check = x:
      assert lib.assertMsg (lib.hasAttr "outuput" x)
        (errorMessageAttrMissing name "outuput");
      assert lib.assertMsg (lib.hasAttr "wallpaper" x)
        (errorMessageAttrMissing name "wallpaper");
      assert lib.assertMsg (lib.hasAttr "position" x)
        (errorMessageAttrMissing name "position");
      (monitorOutputPortType.check x.output
        && monitorWallpaperType.check x.wallpaper
        && monitorPositionType.check x.position);
  };

  monitorTypeList = lib.mkOptionType rec {
    name = "monitor-list";
    description = ''
      A list of "${monitorType.name}".
    '';
    check = x:
      assert lib.assertMsg (lib.isList x) (errorMessageType name "list");
      true;
  };
}
