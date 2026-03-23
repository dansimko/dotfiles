vim.lsp.config["tofu_ls"] = {
    -- cmd       = { "tofu-ls", "serve" },
    -- filetypes = { "opentofu", "terraform" },
    root_markers = { ".git", ".terraform", ".terraform.lock.hcl" },
}

vim.lsp.config["harper_ls"] = {
    flags = {
        debounce_text_changes = 1000,
    },
}

vim.lsp.config["ruff_lsp"] = {
    cmd = { "ruff", "server" },
}

-- ansible-lint is broken :/
vim.lsp.config["ansiblels"] = {
    settings = {
        ansible = {
            validation = {
                lint = { enabled = false },
            },
        },
    },
}

vim.lsp.enable({ "ansiblels", "bashls", "harper_ls", "ruff_lsp", "ty", "tofu_ls", "yamlls" })
