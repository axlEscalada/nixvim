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
    require("noice").setup({
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
          -- filter = {
          --   pattern = {
          --     ":%s*%%s*s:%s*",
          --     ":%s*%%s*s!%s*",
          --     ":%s*%%s*s/%s*",
          --     "%s*s:%s*",
          --     ":%s*s!%s*",
          --     ":%s*s/%s*",
          --   },
          --   icon = "",
          --   lang = "regex",
          -- },
        },
      },
    })
  '';
}
