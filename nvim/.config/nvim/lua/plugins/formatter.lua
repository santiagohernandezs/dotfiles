local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "luacheck" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    typescript = { "biome-check" },
    typst = { "typstyle" },
    terraform = { "terraform_fmt" }
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
    lsp_format = "fallback",
  }
})
