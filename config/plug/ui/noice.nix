{ pkgs, ... }:
{
  plugins.nui.enable = true;

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "noice-fork";
      version = "custom";
      src = pkgs.fetchFromGitHub {
        owner = "axlEscalada";
        repo = "noice.nvim";
        # rev = "a454f52b7a22874f2882674dd0e1b9c7fe9e8e79";
        rev = "5a981b5505a345e9863fceb66f093915ea3d0506";
        hash = "sha256-i/nRHndInloa1HcNtAPqfP5eK+s+Zqq3dcOeeaJObuY=";
      };
      dependencies = with pkgs.vimPlugins; [
        nui-nvim
        nvim-notify
      ];
    })
  ];

  extraConfigLua = ''
    local function ensure_plugin_first(name)
      local plugin_path = vim.fn.globpath(vim.o.runtimepath, "pack/*/start/" .. name, false, true)[1]
      if plugin_path then
        vim.o.runtimepath = vim.o.runtimepath:gsub(vim.pesc(plugin_path) .. ",?", "")
        vim.o.runtimepath = plugin_path .. "," .. vim.o.runtimepath
      end
    end
    
    ensure_plugin_first("nui.nvim")
    
    vim.schedule(function()
      local ok, noice = pcall(require, "noice")
      if not ok then
        vim.notify("Failed to load noice: " .. tostring(noice), vim.log.levels.ERROR)
        return
      end
      
      noice.setup({
        notify = {
          enabled = false,
          view = "notify",
        },
        messages = {
          enabled = true,
          view = "mini",
        },
        lsp = {
          message = {
            enabled = false,
          },
          progress = {
            enabled = false,
            view = "mini",
          },
        },
        popupmenu = {
          enabled = true,
          backend = "nui",
        },
        cmdline = {
          view = "cmdline",
          format = {
            cmdline = {
              pattern = "^:",
              icon = ":",
              lang = "vim",
            },
            filter = {
              pattern = {
                ":%s*%%s*s:%s*",
                ":%s*%%s*s!%s*",
                ":%s*%%s*s/%s*",
                "%s*s:%s*",
                ":%s*s!%s*",
                ":%s*s/%s*",
              },
              icon = "",
              lang = "regex",
            },
            replace = {
              pattern = {
                ":%s*%%s*s:%w*:%s*",
                ":%s*%%s*s!%w*!%s*",
                ":%s*%%s*s/%w*/%s*",
                "%s*s:%w*:%s*",
                ":%s*s!%w*!%s*",
                ":%s*s/%w*/%s*",
              },
              icon = "󱞪",
              lang = "regex",
            },
            range = {
              pattern = {
                ":%s*%%s*s:%w*:%w*:%s*",
                ":%s*%%s*s!%w*!%w*!%s*",
                ":%s*%%s*s/%w*/%w*/%s*",
                "%s*s:%w*:%w*:%s*",
                ":%s*s!%w*!%w*!%s*",
                ":%s*s/%w*/%w*/%s*",
              },
              icon = "",
              lang = "regex",
            },
          },
        },
      })
    end)
  '';
}
