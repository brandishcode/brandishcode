{ lib }:

{
  isListOf = type: list: (lib.types.listOf type).check list;
}
