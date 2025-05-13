{ pkgs, ... }:
{
  plugins = {
    # treesitter.enable = true;
    neotest = {
      enable = true;
      package = pkgs.vimPlugins.neotest.overrideAttrs (old: {
        version = "2024-01-01"; # Use a known working version
      });
      adapters.golang = {
        enable = true;
        settings = {
          dap_go_enabled = true;
          testify_enabled = false;
          warn_test_name_dupes = true;
          warn_test_not_executed = true;
          args = [
            "-v"
            "-race"
            "-count=1"
          ];
        };
      };
      # Add JavaScript/TypeScript neotest adapter
      adapters.jest = {
        enable = true;
      };
    };

    #go install github.com/go-delve/delve/cmd/dlv@latest
    dap = {
      enable = true;
      extensions = {
        dap-go.enable = true;
        dap-ui.enable = true;
        dap-virtual-text.enable = true;
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    FixCursorHold-nvim
    nvim-dap-vscode-js
  ];

  globals = {
    nodejs_bin = "${pkgs.nodejs}/bin/node";
    vscode_js_debug_path = "${pkgs.vscode-js-debug}";
  };

  extraConfigLua = ''
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({})

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo", linehl = "DapStoppedLine", numhl = "DapStoppedLine" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DiagnosticError", linehl = "", numhl = "" })

    -- Configure js-debug server
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = 9123,
      executable = {
        command = "node",
        args = {
          vim.g.vscode_js_debug_path .. "/lib/node_modules/js-debug/dist/src/dapDebugServer.js",
          "9123"
        }
      }
    }

    -- Configure adapters with aliases
    dap.adapters["node"] = dap.adapters["pwa-node"]
    dap.adapters["pwa-chrome"] = dap.adapters["pwa-node"]
    dap.adapters["chrome"] = dap.adapters["pwa-node"]
    dap.adapters["pwa-msedge"] = dap.adapters["pwa-node"]
    dap.adapters["node-terminal"] = dap.adapters["pwa-node"]

    -- Configure Node.js debugging
    for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
      dap.configurations[language] = {
        -- Debug with ts-node (for TypeScript files)
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug with ts-node",
          runtimeExecutable = "npx",
          runtimeArgs = { "ts-node", "''${file}" },
          cwd = "''${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**" },
          console = "integratedTerminal",
        },
        -- Debug compiled JS files
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug JS file",
          program = "''${file}",
          cwd = "''${workspaceFolder}",
          sourceMaps = true,
          outFiles = { "''${workspaceFolder}/**/*.js" },
          console = "integratedTerminal",
        },
        -- Attach to running Node.js process
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to process",
          processId = require("dap.utils").pick_process,
          cwd = "''${workspaceFolder}",
          sourceMaps = true,
        },
      }
    end

    -- Configure direct mapping for node as well
    dap.configurations["node"] = dap.configurations["javascript"]
  '';

  # Keymaps for Neotest
  keymaps = [
    {
      mode = "n";
      key = "<leader>ta";
      action = ":lua require('neotest').run.attach()<CR>";
      options = {
        silent = true;
        desc = "[t]est [a]ttach";
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
      options = {
        silent = true;
        desc = "[t]est run [f]ile";
      };
    }
    {
      mode = "n";
      key = "<leader>tA";
      action = ":lua require('neotest').run.run(vim.uv.cwd())<CR>";
      options = {
        silent = true;
        desc = "[t]est [A]ll files";
      };
    }
    {
      mode = "n";
      key = "<leader>tS";
      action = ":lua require('neotest').run.run({ suite = true })<CR>";
      options = {
        silent = true;
        desc = "[t]est [S]uite";
      };
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = ":lua require('neotest').run.run()<CR>";
      options = {
        silent = true;
        desc = "[t]est [n]earest";
      };
    }
    {
      mode = "n";
      key = "<leader>tl";
      action = ":lua require('neotest').run.run_last()<CR>";
      options = {
        silent = true;
        desc = "[t]est [l]ast";
      };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = ":lua require('neotest').summary.toggle()<CR>";
      options = {
        silent = true;
        desc = "[t]est [s]ummary";
      };
    }
    {
      mode = "n";
      key = "<leader>to";
      action = ":lua require('neotest').output.open({ enter = true, auto_close = true })<CR>";
      options = {
        silent = true;
        desc = "[t]est [o]utput";
      };
    }
    {
      mode = "n";
      key = "<leader>tO";
      action = ":lua require('neotest').output_panel.toggle()<CR>";
      options = {
        silent = true;
        desc = "[t]est [O]utput panel";
      };
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = ":lua require('neotest').run.stop()<CR>";
      options = {
        silent = true;
        desc = "[t]est [t]erminate";
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action = ":lua require('neotest').run.run({ suite = false, strategy = 'dap' })<CR>";
      options = {
        silent = true;
        desc = "Debug nearest test";
      };
    }
    # DAP
    {
      mode = "n";
      key = "<leader>db";
      action = ":lua require('dap').toggle_breakpoint()<CR>";
      options.desc = "toggle [d]ebug [b]reakpoint";
    }
    {
      mode = "n";
      key = "<leader>dB";
      action = ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
      options.desc = "[d]ebug [B]reakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":lua require('dap').continue()<CR>";
      options.desc = "[d]ebug [c]ontinue (start here)";
    }
    {
      mode = "n";
      key = "<leader>dC";
      action = ":lua require('dap').run_to_cursor()<CR>";
      options.desc = "[d]ebug [C]ursor";
    }
    {
      mode = "n";
      key = "<leader>dg";
      action = ":lua require('dap').goto_()<CR>";
      options.desc = "[d]ebug [g]o to line";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":lua require('dap').step_over()<CR>";
      options.desc = "[d]ebug step [o]ver";
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":lua require('dap').step_out()<CR>";
      options.desc = "[d]ebug step [O]ut";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":lua require('dap').step_into()<CR>";
      options.desc = "[d]ebug [i]nto";
    }
    {
      mode = "n";
      key = "<leader>dj";
      action = ":lua require('dap').down()<CR>";
      options.desc = "[d]ebug [j]ump down";
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = ":lua require('dap').up()<CR>";
      options.desc = "[d]ebug [k]ump up";
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = ":lua require('dap').run_last()<CR>";
      options.desc = "[d]ebug [l]ast";
    }
    {
      mode = "n";
      key = "<leader>dp";
      action = ":lua require('dap').pause()<CR>";
      options.desc = "[d]ebug [p]ause";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":lua require('dap').repl.toggle()<CR>";
      options.desc = "[d]ebug [r]epl";
    }
    {
      mode = "n";
      key = "<leader>dR";
      action = ":lua require('dap').clear_breakpoints()<CR>";
      options.desc = "[d]ebug [R]emove breakpoints";
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = ":lua require('dap').session()<CR>";
      options.desc = "[d]ebug [s]ession";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":lua require('dap').terminate()<CR>";
      options.desc = "[d]ebug [t]erminate";
    }
    {
      mode = "n";
      key = "<leader>dw";
      action = ":lua require('dap.ui.widgets').hover()<CR>";
      options.desc = "[d]ebug [w]idgets";
    }

    # DAP UI keymaps
    {
      mode = "n";
      key = "<leader>du";
      action = ":lua require('dapui').toggle({})<CR>";
      options.desc = "[d]ap [u]i";
    }
    {
      mode = "n";
      key = "<leader>de";
      action = ":lua require('dapui').eval()<CR>";
      options.desc = "[d]ap [e]val";
    }

    # Load launch.json and run
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>da";
      action.__raw = ''
        function()
          if vim.fn.filereadable(".vscode/launch.json") then
            require("dap.ext.vscode").load_launchjs()
            print("Loaded launch.json")
          end
          require("dap").continue()
        end
      '';
      options.desc = "Debug with Launch.json";
    }
  ];
}
