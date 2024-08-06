{pkgs, ...}: let
  leetcode-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "kawre/leetcode.nvim";
    version = "0.2.0";
    src = pkgs.fetchFromGitHub {
      owner = "kawre";
      repo = "leetcode.nvim";
      rev = "02fb2c855658ad6b60e43671f6b040c812181a1d";
      hash = "sha256-YoFRd9Uf+Yv4YM6/l7MVLMjfRqhroSS3RCmZvNowIAo=";
    };
  };
in {
  # Enable the plugins that are directly supported by Nixvim
  plugins = {
    telescope.enable = true;
    treesitter.enable = true;
    notify.enable = true;
  };

  # For plugins not directly supported by Nixvim, we use extraPlugins
  extraPlugins = with pkgs.vimPlugins; [
    leetcode-nvim # Now this refers to our custom-built plugin
    plenary-nvim
    nui-nvim
  ];

  # Configuration for leetcode.nvim
  extraConfigLua = ''
    require("leetcode").setup({
      -- Add your configuration options here
    })
  '';

  # Ensure treesitter has the 'html' parser
  plugins.treesitter.ensureInstalled = ["html"]; # extraPlugins = with pkgs.vimUtils; [
}
