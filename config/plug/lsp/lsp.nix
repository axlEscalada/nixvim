{pkgs, ...}: let
  isMacOS = pkgs.stdenv.isDarwin;
in {
  plugins = {
    lsp-format = {enable = true;};
    lsp = {
      enable = true;
      servers = {
        clangd = {enable = true;};
        eslint = {enable = true;};
        html = {enable = true;};
        lua-ls = {enable = !isMacOS;};
        #disable zls here to avoid build zig and zls when nixvim is building, instead i use zls from system
        # zls = {enable = !isMacOS;};
        nil-ls = {enable = true;};
        marksman = {enable = true;};
        pyright = {enable = true;};
        gopls = {enable = true;};
        terraformls = {enable = true;};
        tsserver = {enable = false;};
        yamlls = {
          enable = true;
        };
        nixd.enable = true;
        ruff-lsp.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        # zls.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gld = {
            action = "definition";
            desc = "Goto Definition";
          };
          glr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          glI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          glT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          # K = {
          #   action = "hover";
          #   desc = "Hover";
          # };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }


    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = false
    require'lspconfig'.gopls.setup {
      capabilities = capabilities,
    }
    require'lspconfig'.zls.setup {
       capabilities = capabilities,
       flags = {
         debounce_text_changes = 150,
       }
    }
    require'lspconfig'.rust_analyzer.setup {
      capabilities = capabilities,
    }
    require'lspconfig'.clangd.setup {
      cmd = { "clangd", "--offset-encoding=utf-16" },
    }
  '';
}
