{
  plugins = {
    neorg = {
      enable = true;
      settings.load = {
        "core.defaults" = {
          __empty = null;
        };
        "core.dirman" = {
          config = {
            workspaces = {
              home = "~/notes/home";
            };
            index = "index.norg";
            default_workspace = "home";
          };
        };
        "core.export" = {
          extension = "md";
          extensions = [ "all" ];
        };
        "core.ui.calendar" = {
          __empty = null;
        };
        "core.presenter" = {
          config = {
            zen_mode = "zen-mode";
          };
        };
        "core.concealer" = {
          config = {
            icon_preset = "diamond";
          };
        };
        "core.qol.todo_items" = {
          config = {
            order = {
              __raw = "{{'undone',' '},{'done', 'x'},{'pending', '-'},{'cancelled', '_'}}";
            };
            create_todo_parents = true;
          };
        };
      };
      telescopeIntegration.enable = true;
    };
  };

  extraFiles = {
    "ftplugin/norg.lua".text = ''
      vim.opt_local.conceallevel=2
      vim.g.maplocalleader = ","
      vim.keymap.set('n',
        '<localleader>c',
        '<Plug>(neorg.qol.todo-items.todo.task-cycle)',
        { desc = "Neorg: core.qol.todo-items toggle" }
      )
      vim.keymap.set('n',
        '<localleader>pn',
        '<Plug>(neorg.presenter.next-page)',
        { desc = "Neorg: core.presenter next-page" }
      )
      vim.keymap.set('n',
        '<localleader>pp',
        '<Plug>(neorg.presenter.previous-page)',
        { desc = "Neorg: core.presenter previous-page" }
      )
      vim.keymap.set('n',
        '<localleader>pc',
        '<Plug>(neorg.presenter.close)',
        { desc = "Neorg: core.presenter close" }
      )
    '';
  };
}
