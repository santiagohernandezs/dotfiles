-- [[ Treesitter Start ]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "typescript", "javascript", "rust", "tsx", "ledger", "python" },
  callback = function()
    vim.treesitter.start()
  end,
})

-- [[ LSP Formatting ]]
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Skip LSP formatting for Astro files to use Prettier instead
    if vim.bo[ev.buf].filetype == "astro" then
      return
    end

    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
        end,
      })
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end

    if client.server_capabilities.codeLensProvider then
      vim.lsp.codelens.enable(true, { bufnr = ev.buf })
    end
  end,
})

-- [[ Astro Formatting with Prettier ]]
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.astro",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd("%!npx prettier --stdin-filepath " .. vim.fn.expand("%:p"))
    if vim.v.shell_error ~= 0 then
      vim.cmd("undo")
    end
    vim.fn.winrestview(view)
  end,
})
