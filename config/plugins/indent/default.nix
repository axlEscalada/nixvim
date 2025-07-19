{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        # char = "│";
        char = "▏";
      };
      scope = {
        enabled = false;
      };
      exclude = {
        filetypes = [
          "help"
          "terminal"
          "dashboard"
        ];
      };
    };
  };

  extraConfigLua = ''
    local hooks = require("ibl.hooks")
    hooks.register(
      hooks.type.WHITESPACE,
      hooks.builtin.hide_first_space_indent_level
    )
  '';
}
