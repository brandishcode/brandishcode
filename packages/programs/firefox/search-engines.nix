{
  search.engines = {
    nix-packages = {
      name = "Nix packages";
      urls = [
        {
          template = "https://search.nixos.org/packages";
          params = [
            {
              name = "type";
              value = "packages";
            }
            {
              name = "query";
              value = "{searchTerms}";
            }
          ];
        }
      ];
      definedAliases = [ "@nxp" ];
    };
    nix-options = {
      name = "Nix options";
      urls = [
        {
          template = "https://search.nixos.org/options";
          params = [
            {
              name = "type";
              value = "packages";
            }
            {
              name = "query";
              value = "{searchTerms}";
            }
          ];
        }
      ];
      definedAliases = [ "@nxo" ];
    };
    nixvim-docs = {
      name = "Nixvim docs";
      urls = [
        {
          template = "https://nix-community.github.io/nixvim";
          params = [
            {
              name = "search";
              value = "{searchTerms}";
            }
          ];
        }
      ];
      definedAliases = [ "@nxv" ];
    };
  };
}
