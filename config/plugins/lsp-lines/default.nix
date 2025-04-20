{
  plugins.lsp-lines = {
    enable = true;
  };
  extraConfigLua = ''
    vim.diagnostic.config({ virtual_lines = true })
  '';
}
