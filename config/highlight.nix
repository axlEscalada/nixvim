{
  config,
  lib,
  ...
}: let
  colors = import ../config/colors/${config.theme}.nix {};
in {
  config = lib.mkIf config.colorschemes.base16.enable {
    highlight = {
      Comment = {
        fg = "#5d5d5d";
      };
      Search = {
        fg = "#FFFFFF";
        bg = "#898CE8";
      };
      CurSearch = {
        fg = "#000000";
        bg = "#dda2de";
      };
      IncSearch = {
        fg = "#000000";
        bg = "#dda2de";
      };
      CursorLine = {
        fg = "none";
        bg = "none";
      };
      CursorLineNr = {
        fg = "none";
        bg = "none";
      };

      AlphaHeader = {
        fg = colors.base0E;
        bg = "none";
      };

      StatusNormal = {
        bg = "none";
        fg = "none";
      };

      TelescopeBorder = {
        fg = "#1c1b1b";
        bg = "none";
      };
      TelescopePromptBorder = {
        fg = "#1c1b1b";
        bg = "none";
      };
      TelescopePromptNormal = {
        fg = "none";
        bg = colors.base01;
      };
      TelescopePromptPrefix = {
        fg = colors.base08;
        bg = colors.base01;
      };
      TelescopeSelection = {
        fg = "none";
        bg = colors.base01;
      };

      Pmenu = {
        fg = "none";
        bg = colors.base01;
      };
      PmenuSbar = {
        fg = "none";
        bg = colors.base01;
      };
      PmenuThumb = {
        fg = "none";
        bg = colors.base01;
      };
      PmenuSel = {
        fg = "none";
        bg = colors.base02;
      };

      CmpItemAbbrMatch = {
        fg = "#ede6e1";
        bg = "none";
      };
      CmpItemAbbrMatchFuzzy = {
        fg = "#ede6e1";
        bg = "none";
      };
      CmpItemAbbr = {
        fg = "#a877f7";
        bg = "none";
      };
      CmpItemAbbrDeprecated = {
        fg = "#a877f7";
        bg = "none";
      };
      CmpItemKind = {
        fg = colors.base0E;
        bg = "none";
      };
      CmpItemMenu = {
        fg = "#bd4646";
        bg = "#bd4646";
      };
      CmpItemKindSnippet = {
        fg = colors.base0E;
        bg = "none";
      };

      VertSplit = {
        fg = colors.base01;
        bg = "none";
      };
      FloatBorder = {
        fg = colors.base01;
        bg = colors.base01;
      };
      NormalFloat = {
        fg = "none";
        bg = colors.base01;
      };

      LineNr = {
        fg = colors.base03;
        bg = "none";
      };

      NoiceCmdlinePopup = {
        fg = colors.base04;
        bg = colors.base01;
      };
      NoiceCmdlinePopupBorder = {
        fg = colors.base01;
        bg = colors.base01;
      };
      NoiceCmdlinePopupBorderSearch = {
        fg = colors.base01;
        bg = colors.base01;
      };

      TSAttribute = {
        fg = colors.base0D;
      };
      TSBoolean = {
        fg = colors.base0D;
      };
      TSCharacter = {
        fg = colors.base0D;
      };
      TSComment = {
        fg = "#5d5d5d";
        italic = true;
      };
      TSConditional = {
        fg = colors.base08;
      };
      TSConstant = {
        fg = colors.base0D;
      };
      TSConstBuiltin = {
        fg = colors.base0D;
      };
      TSConstMacro = {
        fg = colors.base0A;
      };
      TSConstructor = {
        fg = colors.base0D;
      };
      TSException = {
        fg = colors.base03;
      };
      TSField = {
        fg = colors.base08;
      };
      TSFloat = {
        fg = colors.base03;
      };
      TSFunction = {
        fg = colors.base08;
      };
      TSFuncBuiltin = {
        fg = colors.base0C;
      };
      TSFuncMacro = {
        fg = colors.base0B;
      };
      TSInclude = {
        fg = colors.base08;
      };
      TSKeyword = {
        fg = colors.base0E;
      };
      TSKeywordFunction = {
        fg = colors.base0D;
      };
      TsKeywordOperator = {
        fg = colors.base0D;
      };
      TSKeywordReturn = {
        fg = colors.base0D;
      };
      TSLabel = {
        fg = colors.base0D;
      };
      TSMethod = {
        fg = colors.base0D;
      };
      TSNamespace = {
        fg = colors.base08;
      };
      TSNumber = {
        fg = colors.base0A;
      };
      TSParameter = {
        fg = colors.base08;
      };
      TSParameterReference = {
        fg = colors.base08;
      };
      TSProperty = {
        fg = colors.base08;
      };
      TSPunctDelimiter = {
        fg = colors.base05;
      };
      TSPunctBracket = {
        fg = colors.base05;
      };
      TSPunctSpecial = {
        fg = colors.base05;
      };
      TSRepeat = {
        fg = colors.base0A;
      };
      TSString = {
        fg = colors.base0B;
      };
      TSStringRegex = {
        fg = colors.base0B;
      };
      TSStringEscape = {
        fg = colors.base0D;
      };
      TSStringSpecial = {
        fg = colors.base0D;
      };
      TSSymbol = {
        fg = colors.base08;
      };
      TSTag = {
        fg = colors.base0D;
      };
      TSTagAttribute = {
        fg = colors.base08;
      };
      TSTagDelimiter = {
        fg = colors.base05;
      };
      TSText = {
        fg = colors.base05;
      };
      TSStrong = {
        fg = colors.base05;
      };
      TSEmphasis = {
        italic = true;
        fg = colors.base05;
      };
      TSUnderline = {
        fg = colors.base0E;
      };
      TSStrike = {
        fg = colors.base05;
      };
      TSTitle = {
        fg = colors.base0A;
      };
      TSLiteral = {
        fg = colors.base0B;
      };
      TSURI = {
        fg = colors.base0A;
      };
      TSMath = {
        fg = colors.base0D;
      };
      TSTextReference = {
        fg = colors.base0D;
      };
      TSEnvirontment = {
        fg = colors.base0E;
      };
      TSEnvironmentName = {
        fg = colors.base0A;
      };
      TSNote = {
        fg = colors.base03;
      };
      TSWarning = {
        fg = colors.base00;
        bg = colors.base08;
      };
      TSDanger = {
        fg = colors.base03;
      };
      TSType = {
        fg = colors.base0A;
      };
      TSTypeBuiltin = {
        fg = colors.base0A;
      };
      TSVariable = {
        fg = colors.base05;
      };
      TSVariableBuiltin = {
        fg = colors.base0D;
      };
    };
  };
}
