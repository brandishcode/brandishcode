{ lib }:

{
  userType = lib.mkOptionType {
    name = "user";
    description = ''
      User details.
      - username
      - email
    '';
    check =
      x:
      lib.hasAttr "username" x
      && lib.isString x.username
      && lib.hasAttr "email" x
      && lib.isString x.email;
  };
}
