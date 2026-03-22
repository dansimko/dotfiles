return {
    "stevearc/conform.nvim",
    version = "v9.1.0",
    opts = {
	formatters_by_ft = {
	    python = { "ruff_organize_imports", "ruff_format" },
	},
	format_on_save = function(bufnr)
	    -- Disable with a global or buffer-local variable
	    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
		return
	    end
	    return { timeout_ms = 500, lsp_format = "fallback" }
	end
    },
}
