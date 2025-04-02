{ lib }:

let
  inherit (import ../../../helpers/error-messages { })
    errorMessageAttrMissing errorMessageAttrType;
  name = "display-manager";
  displayManagerExtraConfigChecker = x:
    if (lib.hasAttr "extraConfig" x) then
      (with x;
        if x.name == "sddm" then
          if (lib.hasAttr "themePackages" extraConfig) then
            assert lib.assertMsg (lib.isList extraConfig.themePackages)
              (errorMessageAttrType (x.name + "extraConfig") "themePackages"
                "list of packages");
            assert lib.assertMsg (lib.isString extraConfig.themeName
              || lib.isStorePath x.extraConfig.theme)
              (errorMessageAttrType (x.name + "extraConfig") "themeName"
                "string");
            true
          else
            true
        else
          false)
    else
      true;
in {
  displayManagerType = lib.mkOptionType {
    inherit name;
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
      assert lib.assertMsg (lib.hasAttr "enable" x)
        (errorMessageAttrMissing name "enable");
      assert lib.assertMsg (lib.isBool x.enable)
        (errorMessageAttrType name "enable" "bool");
      assert lib.assertMsg (lib.hasAttr "name" x)
        (errorMessageAttrMissing name "name");
      assert lib.assertMsg (builtins.elem x.name [ "sddm" ])
        (errorMessageAttrType name "name" "sddm");
      (displayManagerExtraConfigChecker x);
  };
}
