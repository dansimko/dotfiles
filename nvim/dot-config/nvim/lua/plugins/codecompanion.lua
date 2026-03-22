return {
    "olimorris/codecompanion.nvim",
    version = "v19.6.0",
    dependencies = {
        { "nvim-lua/plenary.nvim", version = "v0.1.4" },
        -- { "nvim-treesitter/nvim-treesitter", version = "v0.10.0" },
    },
    opts = {
        -- NOTE: The log_level is in `opts.opts`
        opts = {
            -- log_level = "DEBUG", -- or "TRACE"
        },
        adapters = {
            opencode = function()
                return require("codecompanion.adapters").extend("opencode", {
                    defaults = {
                        mode = "plan",
                    },
                })
            end,
            http = {
                -- ["litellm"] = function()
                --     return require("codecompanion.adapters").extend("openai_responses", {
                --         url = "http://localhost:4000/v1/responses",
                --         schema = {
                --             model = {
                --                 default = "claude-sonnet-4-6",
                --                 choices = {
                --                     ["claude-sonnet-4-6"] = {
                --                         formatted_name = "Claude Sonnet 4.6",
                --                         opts = { has_function_calling = true, has_vision = false, can_reason = true },
                --                     },
                --                 },
                --             },
                --             temperature = {
                --                 default = nil,
                --             },
                --             top_k = {
                --                 default = nil,
                --             },
                --         },
                --     })
                -- end,
                ["litellm"] = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "http://localhost:4000",
                        },
                        schema = {
                            model = {
                                default = "claude-sonnet-4-6",
                            },
                        },
                    })
                end,
            }
        },
        interactions = {
            chat = {
                adapter = "opencode",
                editor_context = {
                    ["buffer"] = {
                        opts = {
                            -- Always sync the buffer by sharing its "diff"
                            -- Or choose "all" to share the entire buffer
                            default_params = "diff",
                        },
                    },
                },
            },
            inline = {
                adapter = "litellm",
            },
        },
        display = {
            chat = {
                show_settings = true,
                show_token_count = true,
                show_tools_processing = true,
            },
            diff = {
                enabled = true,
                word_highlights = {
                    additions = true,
                    deletions = true,
                },
            },
        },
    },
}
