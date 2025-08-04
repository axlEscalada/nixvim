{
  plugins.indent-blankline = {
    # disable because it collition with cursor_invert_fg_bg (ghostty)
    # it just turn "black" cursor when there is a indent line
    enable = false;
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

  # disable indent plugin
  # extraConfigLua = ''
  #   local hooks = require("ibl.hooks")
  #   hooks.register(
  #     hooks.type.WHITESPACE,
  #     hooks.builtin.hide_first_space_indent_level
  #   )
  # '';
}
