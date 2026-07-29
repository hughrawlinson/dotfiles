return {
  -- Import LazyVim's Python extra (ruff LSP, pyright, venv-selector, dap, etc.)
  { import = "lazyvim.plugins.extras.lang.python" },

  -- Configure ruff as the Python formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
      },
    },
  },

  -- Ensure ruff is installed via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "debugpy",
      },
    },
  },
}
