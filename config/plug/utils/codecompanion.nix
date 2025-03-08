{
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        gemini.__raw = ''
          function()
            return require('codecompanion.adapters').extend('gemini', {
                -- env = {
                --     url = "http://127.0.0.1:11434",
                -- },
                schema = {
                    model = {
                      default = 'gemini-2.0-flash',
                    },
                    num_ctx = {
                        default = 32768,
                    },
                },
                env = {
                  api_key = "GEMINI_API_KEY",
                },
            })
          end
        '';
      };
      strategies = {
        chat.adapter = "gemini";
        inline.adapter = "gemini";
        agent.adapter = "gemini";
      };
    };
  };
  keymaps = [
    {
      key = "<leader>cc";
      action = ":CodeCompanionChat<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle CodeCompanion";
      };
    }
    {
      key = "<leader>cf";
      action = ":CodeCompanionActions<CR>";
      mode = "n";
      options = {
        silent = true;
        desc = "CodeCompanion Actions";
      };
    }
  ];
}
