-- [[ Treesitter Start ]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "typescript", "javascript", "rust", "tsx", "ledger", "python" },
  callback = function()
    vim.treesitter.start()
  end,
})

-- [[ LSP Attach features ]]
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end

    if client.server_capabilities.codeLensProvider then
      vim.lsp.codelens.enable(true, { bufnr = ev.buf })
    end
  end,
})
