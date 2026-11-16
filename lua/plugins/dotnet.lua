return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- hosts the roslyn package
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {
      choose_target = function(targets)
        if not vim.fn.getcwd():find("lipila%-blaze", 1, false) then
          return nil -- other projects: normal prompt
        end
        return vim.iter(targets):find(function(t)
          return t:match("/LipilaBlaze%.sln$") ~= nil
        end)
      end,
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.adapters.coreclr = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch",
          request = "launch",
          program = function()
            return vim.fn.input("DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { cs = { "csharpier" } } },
  },
}
