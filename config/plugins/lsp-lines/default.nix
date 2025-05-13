{
  plugins.lsp-lines = {
    enable = true;
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ll";
      action = ":lua require('lsp_lines').toggle()<CR>";
      options = {
        silent = true;
        desc = "Toggle lsp_lines";
      };
    }
  ];
  extraConfigLua = ''
    vim.diagnostic.config({ virtual_lines = true })
  '';
}
