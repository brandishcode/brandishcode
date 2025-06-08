{
  lib,
  jsSupport,
  javaSupport,
  ...
}:

{
  imports =
    [ ./config ]
    ++ lib.optionals jsSupport [ ./languages/javascript ]
    ++ lib.optionals javaSupport [ ./languages/java ];
}
