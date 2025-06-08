{
  lib,
  jsSupport,
  javaSupport,
  ...
}:

{
  imports =
    [ ./config ] ++ lib.optionals jsSupport [ ./javascript ] ++ lib.optionals javaSupport [ ./java ];
}
