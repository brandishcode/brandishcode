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
}
