{
  plugins.fugitive = {
    enable = true;
  };

  # Git-related keymaps
  keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
      options = {
        desc = "Git status";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gdiffsplit<CR>";
      options = {
        desc = "Git diff split";
      };
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>Git commit<CR>";
      options = {
        desc = "Git commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Git blame<CR>";
      options = {
        desc = "Git blame";
      };
    }
    {
      mode = "n";
      key = "<leader>gm";
      action = "<cmd>Git mergetool<CR>";
      options = {
        desc = "Git mergetool";
      };
    }
  ];

  # Improve diff experience
  opts = {
    diffopt = "internal,filler,closeoff,hiddenoff,algorithm:patience,indent-heuristic";
  };
}
