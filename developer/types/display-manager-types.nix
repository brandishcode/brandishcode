{ lib, myLib }:

let
  displayManagerExtraConfigChecker = x:
    if (lib.hasAttr "extraConfig" x) then
      (with x;
        if name == "sddm" then
          if (lib.hasAttr "themePackages" extraConfig) then
            myLib.isListOf lib.types.package extraConfig.themePackages
            && lib.isString extraConfig.themeName
            && myLib.isListOf lib.types.package extraConfig.qtPackages
          else
            true
        else
          false)
    else
      true;
in {
  displayManagerType = lib.mkOptionType {
    name = "display-manager";
    description = ''
      Display manager to be used.
      - sddm (Simple Desktop Display Manager) 
      sddm:
      extraConfig = {
        themePackage = <package_name>;
        themeName = <theme_name>;
      }
    '';
    check = x:
      lib.hasAttr "enable" x && lib.isBool x.enable && lib.hasAttr "name" x
      && builtins.elem x.name [ "sddm" ]
      && (displayManagerExtraConfigChecker x);
  };
}
