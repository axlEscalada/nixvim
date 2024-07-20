{
  pkgs,
  lib,
  ...
}: let
  mason = {
    owner = "williamboman";
    repo = "mason.nvim";
    rev = "c43eeb5614a09dc17c03a7fb49de2e05de203924";
    hash = "sha256-PwGDedx3Z2qwmGHa5edtFqungyU0rAI1BU8dQWcVblE=";
  };
in {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "mason";
      version = "1.10.0";
      src = pkgs.fetchFromGitHub mason;
      meta = {
        description = "Mason";
        homepage = "https://github.com/williamboman/mason.nvim/";
        license = lib.licenses.gpl3;
      };
    })
  ];
}
