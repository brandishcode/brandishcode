{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = { desc = "Telescope [F]ind [F]iles"; };
      }
      {
        key = "<leader>gf";
        action = "<cmd>Telescope git_files<cr>";
        options = { desc = "Telescope [G]it [F]iles"; };
      }
      {
        key = "<leader>ps";
        action = {
          __raw = ''
            function() 
              require"telescope.builtin".grep_string({ search = vim.fn.input("Grep > ")})
            end
          '';
        };
        options = { desc = "Telescope [G]rep [S]tring"; };
      }
      {
        key = "<leader>sh";
        action = "<cmd>Telescope help_tags<cr>";
        options = { desc = "Telescope [S]earch [H]elp"; };
      }
    ];

    autoGroups = { lsp-attach = { clear = true; }; };

    autoCmd = [{
      event = [ "LspAttach" ];
      group = "lsp-attach";
      callback = {
        __raw = ''
          function(event)
          	local builtin = require("telescope.builtin")
          	local map = function(keys, func, desc)
          		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          	end

          	map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
          	map("gr", builtin.lsp_references, "[G]oto [R]eferences")
          	map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
          	map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
          	map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
          	map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
            map("<leader>sw", builtin.grep_string, "[S]earch [W]ord")
          	map("K", vim.lsp.buf.hover, "Hover Documentation")
          	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          	vim.keymap.set("i", "<C-h>", function()
          		vim.lsp.buf.signature_help()
          	end, { buffer = event.buf, desc = "LSP: Signature Help" })
          end
        '';
      };
    }];
  };
}
