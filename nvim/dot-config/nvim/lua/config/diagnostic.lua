vim.diagnostic.config({
  virtual_text = true,           -- Show text at the end of the line
  signs = true,                  -- Show icons in the gutter
  underline = true,              -- Underline the error in the code
  update_in_insert = true,       -- Don't update while typing (less distracting)
  severity_sort = true,          -- Sort by severity (errors first)
  float = {
    source = 'always',           -- Show which LSP the error is from
  },
  underline = { severity = { min = vim.diagnostic.severity.HINT } },
  virtual_text = { severity = { min = vim.diagnostic.severity.HINT } },
})

vim.opt.updatetime = 500

-- Automatically open diagnostic on hover
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      -- close_events = { "CursorMoved", "BufLeave", "InsertEnter", "FocusLost" },
      -- border = 'rounded',
      source = 'always',
      -- prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
