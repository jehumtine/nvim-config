-- KCL (Zoo / KittyCAD) editing workflow
-- .kcl filetype + treesitter grammar + LSP + formatting
-- (keymaps live in lua/config/keymaps.lua)

-- 1. Filetype detection. Plugin spec files are sourced at startup, so this
--    runs before any file is opened.
vim.filetype.add({ extension = { kcl = "kcl" } })

return {
  -- 2. Treesitter grammar (custom — not in the built-in registry)
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      local install_info = {
        url = "https://github.com/KittyCAD/tree-sitter-kcl",
        revision = "f96734a2a1f097f382d99fcf8e83e813ddbefaa3",
        queries = "queries", -- use the repo's own query files
      }
      local function register_kcl()
        require("nvim-treesitter.parsers").kcl = { install_info = install_info }
      end
      register_kcl()
      -- keep it registered across future :TSUpdate runs
      vim.api.nvim_create_autocmd("User", { pattern = "TSUpdate", callback = register_kcl })
      -- auto-install the parser on next startup
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "kcl" })
      end
    end,
  },

  -- 3. LSP: kcl-language-server (binary at ~/bin)
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.kcl_lsp = {
        mason = false,
        cmd = { "kcl-language-server", "server", "--stdio" },
        filetypes = { "kcl" },
        root_markers = { "project.toml", ".git" },
      }
    end,
  },

  -- 4. Formatting via `zoo kcl format` (local, no API needed)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.kcl = { "zoo_kcl_format" }
      opts.formatters = opts.formatters or {}
      opts.formatters.zoo_kcl_format = {
        command = "zoo",
        args = { "kcl", "format", "-" },
        stdin = true,
      }
    end,
  },
}
