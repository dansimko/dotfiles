return {
    "olimorris/codecompanion.nvim",
    version = "v19.6.0",
    dependencies = {
        { "nvim-lua/plenary.nvim", version = "v0.1.4" },
        -- { "nvim-treesitter/nvim-treesitter", version = "v0.10.0" },  -- use system-wide tree-sitter config
    },
    config = function()
        require("config.plugins.codecompanion")
    end,
}
