{ pkgs, ... }:
{
  extraPackages = with pkgs; [ shfmt ];
  plugins.conform-nvim = {
    enable = true;

    lazyLoad.settings = {
      cmd = [
        "ConformInfo"
        "ConformFormat"
      ];
      event = [
        "BufRead"
        "BufNewFile"
      ];
    };

    settings = {
      # format_on_save = {
      #   lspFallback = true;
      #   timeoutMs = 500;
      # };
      notify_on_error = true;

      formatters_by_ft = {
        python = [ "black" ];
        go = [
          "goimports"
          "gofmt"
        ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        markdown = [ "prettier" ];
        yaml = [ "yamlfmt" ];
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        javascriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        typescript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        typescriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        terragrunt = [
          "hcl"
        ];
        bash = [
          "shfmt"
        ];
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ff";
      action = "<cmd>lua require('conform').format({ lsp_fallback = true })<cr>";
      options.desc = "Format buffer";
    }
  ];
}
