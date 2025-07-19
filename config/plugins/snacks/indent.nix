{
  plugins.snacks = {
    settings = {
      indent = {
        indent = {
          priority = 1;
          enabled = false;
          char = "│";
          only_scope = false;
          only_current = false;
          hl = "SnacksIndent";
        };
        scope = {
          enabled = false;
        };
        # chunk = {
        #   enabled = false;
        #   only_current = true;
        #   char = {
        #     arrow = "─";
        #     corner_top = "╭";
        #     corner_bottom = "╰";
        #   };
        #   hl = "SnacksIndentChunk";
        # };
      };
    };
  };

}
