vim.pack.add({
  -- Mini
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-mini/mini.files",
  "https://github.com/nvim-mini/mini.basics",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.clue",
  "https://github.com/nvim-mini/mini.snippets",
  "https://github.com/nvim-mini/mini.completion",
  "https://github.com/nvim-mini/mini.pick",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/nvim-mini/mini.move",
  "https://github.com/nvim-mini/mini.extra",
  "https://github.com/nvim-mini/mini.statusline",

  -- Colorscheme
  "https://github.com/rebelot/kanagawa.nvim",

  -- Treesitter and LSP
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mfussenegger/nvim-lint",

  "https://github.com/rafamadriz/friendly-snippets",

  -- LSP
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/b0o/SchemaStore.nvim",

  -- Git
  "https://github.com/lewis6991/gitsigns.nvim"
})

-- [[ Plugin Configurations ]]
require("plugins.ui")
require("plugins.mini")
require("plugins.lsp")
require("plugins.treesitter")
