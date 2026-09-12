return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, { buffer = bufnr, desc = "Code Action" })
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { buffer = bufnr, desc = "Hover" })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = false,
              noDefaultFeatures = false,
            },
            check = {
              command = "check", -- use check instead of clippy, much lighter
            },
            procMacro = {
              enable = false, -- proc macros are expensive, disable unless needed
            },
            diagnostics = {
              enable = true,
              disabled = { "macro-error" },
              experimental = {
                enable = false, -- no experimental diagnostics
              },
            },
            inlayHints = {
              enable = false, -- inlay hints constantly recompute, kill them
            },
            lens = {
              enable = false, -- code lens is expensive
            },
            completion = {
              autoimport = {
                enable = true,
              },
            },
            indexing = {
              workers = 1, -- limit to 1 worker so it doesn't hog cores
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {},
  },
}
