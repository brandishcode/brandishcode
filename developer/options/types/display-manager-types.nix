{ lib }:

let helpersErrorMessages = (import ../../../helpers/error-messages { });
in with helpersErrorMessages; {
  displayManagerType = lib.mkOptionType rec {
    name = "display-manager";
    description = ''
      Display manager to be used.
      - sddm (Simple Desktop Display Manager) 
    '';
    check = x:
      assert lib.assertMsg ((lib.isString x) && (x == "sddm"))
        (errorMessageType name "sddm");
      true;
  };
}
