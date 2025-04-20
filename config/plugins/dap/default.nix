{ }
# {
#   plugins.dap = {
#     enable = true;
#     extensions.dap-go.enable = true;
#     configurations.go = [
#       {
#         type = "go";
#         name = "Debug Current File";
#         request = "launch";
#         # Use a Lua function to dynamically get the file path
#         program = "__luaFile__"; # This will be replaced by the Lua function
#         args = "__luaFunc__.get_arguments";
#         buildFlags = "__luaFunc__.get_build_flags";
#       }
#     ];
#   };
#   extraConfigLua = ''
#     local function get_current_file()
#       return vim.fn.expand('%:p')
#     end
#
#     local dap = require('dap')
#
#     dap.configurations.go[1].program = get_current_file
#
#     vim.api.nvim_create_user_command('DebugGoFile', function()
#       dap.configurations.go[1].program = get_current_file()
#       dap.continue()
#     end, {})
#   '';
# }
