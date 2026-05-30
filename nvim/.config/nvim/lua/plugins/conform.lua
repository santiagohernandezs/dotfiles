local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "biome-check" },
    typescript = { "biome-check" },
    javascriptreact = { "biome-check" },
    typescriptreact = { "biome-check" },
    json = { "biome-check" },
    jsonc = { "biome-check" },
    css = { "biome-check" },
    astro = { "prettier" },
    lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})
