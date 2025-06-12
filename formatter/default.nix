{
  flake-utils,
  bcfmt,
  ...
}:

flake-utils.lib.eachDefaultSystem (system: {
  formatter = bcfmt.formatter.${system};
})
