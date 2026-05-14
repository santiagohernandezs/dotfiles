-- [[ LSP Setup ]]
local servers = { "lua_ls", "rust_analyzer", "jsonls", "yamlls", "ts_ls", "bashls", "astro", "qml-language-server" }
vim.lsp.enable(servers)

-- Configuración global de diagnósticos
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  severity_sort = true,
  float = { border = "rounded" },
})

-- [[ Linting ]]
local lint = require("lint")

lint.linters.qmllint = {
  cmd = "qmllint",
  stdin = false,
  append_fname = true,
  stream = "both",
  ignore_exitcode = true,
  parser = require("lint.parser").from_pattern("([^:]+):(%d+)%s-:%s-(.*)", { "file", "lnum", "message" }),
}

lint.linters_by_ft = {
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  javascriptreact = { "biomejs" },
  typescriptreact = { "biomejs" },
  json = { "biomejs" },
  python = { "pylint" },
  go = { "golangcilint" },
  sh = { "shellcheck" },
  lua = { "luacheck" },
  qml = { "qmllint" }
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
