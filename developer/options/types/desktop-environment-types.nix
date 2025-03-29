{ lib }:
let helpersErrorMessages = (import ../../helpers/error-messages { });
in with helpersErrorMessages; {
  desktopEnvironmentType = lib.mkOptionType rec {
    name = "desktop-environment";
    description = ''
      Can be one of the following:
        - sway
        - plasma
    '';
    check = x:
      assert lib.assertMsg (x == "sway") (errorMessageType name "sway|plasma");
      true;
  };
}
