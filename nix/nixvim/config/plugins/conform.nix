{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    nixfmt-rfc-style
    luaformatter
  ];
  plugins.conform-nvim = {
    enable = true;
    luaConfig.post = ''
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
    '';
    settings.formatters_by_ft = {
      nix = [ "nixfmt" ];
      lua = [ "lua-format" ];
    };
  };
  keymaps = [
    {
      mode = "n";
      action = "<Cmd>Format<Cr>";
      key = "<Leader>ft";
    }
  ];

}
