{ config, ... }:
let
  highlights = import ./highlight.nix;
in
{
  colorschemes = {
    rose-pine = {
      enable = false;
      settings = {
        styles = {
          bold = false;
          italic = true;
          transparency = true;
        };
        highlight_groups = highlights;
      };
    };
    base16 = {
      enable = true;
      setUpBar = false;
      colorscheme = import ../../colors/${config.theme}.nix { };
      settings = {
        cmp = true;
        illuminate = true;
        indentblankline = true;
        lsp_semantic = true;
        mini_completion = true;
        telescope = true;
        telescope_borders = false;
      };
    };
  };
}
