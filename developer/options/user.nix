{ lib, myTypes, ... }:

let username = "developer";
in {
  options = {
    user = lib.mkOption {
      default = {
        inherit username;
        email = "${username}@mail.com";
      };
      description = ''
        User details
      '';
      type = myTypes.userType;
    };
  };
}
