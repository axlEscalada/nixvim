{
  pkgs,
  ...
}:
{
  extraPlugins = with pkgs.vimPlugins; [
    blink-ripgrep-nvim
  ];

  extraPackages = with pkgs; [
    gh
  ];

  plugins = {
    # blink-cmp-dictionary.enable = true;
    # blink-cmp-spell.enable = true;
    # blink-cmp-git.enable = true;
    # blink-emoji.enable = true;
    # blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        keymap = {
          preset = "default";
          "<CR>" = [
            "select_and_accept"
            "fallback"
          ];
          "<Tab>" = [
            "select_and_accept"
            "fallback"
          ];
          "<Up>" = [
            "select_prev"
            "fallback"
          ];
          "<Down>" = [
            "select_next"
            "fallback"
          ];
        };
        signature = {
          enabled = true;
        };

        sources = {
          default = [
            "buffer"
            "lsp"
            "path"
            "snippets"
            # Community
            # "dictionary"
            # "emoji"
            # "git"
            # "spell"
            # "ripgrep"
          ];
          providers = {
            lsp.score_offset = 1;
            # ripgrep = {
            #   name = "Ripgrep";
            #   module = "blink-ripgrep";
            #   score_offset = 2;
            # };
            # dictionary = {
            #   name = "Dict";
            #   module = "blink-cmp-dictionary";
            #   min_keyword_length = 3;
            # };
            # emoji = {
            #   name = "Emoji";
            #   module = "blink-emoji";
            #   score_offset = 5;
            # };
            # spell = {
            #   name = "Spell";
            #   module = "blink-cmp-spell";
            #   score_offset = 1;
            # };
            # git = {
            #   module = "blink-cmp-git";
            #   name = "git";
            #   score_offset = 100;
            #   opts = {
            #     commit = { };
            #     git_centers = {
            #       git_hub = { };
            #     };
            #   };
            # };
          };
        };

        appearance = {
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "🤶";
          };
        };
        completion = {
          menu = {
            border = "none";
            draw = {
              gap = 1;
              treesitter = [ "lsp" ];
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
            };
          };
          trigger = {
            show_in_snippet = false;
          };
          documentation = {
            auto_show = true;
            window = {
              border = "single";
            };
          };
          accept = {
            auto_brackets = {
              enabled = false;
            };
          };
        };
      };
    };
  };
}
