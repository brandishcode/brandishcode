{
  flake-utils,
  formatter,
  ...
}:

flake-utils.lib.eachDefaultSystem (system: {
  formatter = formatter.formatter.${system};
})
