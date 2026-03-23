local lint = require("lint")

--
-- Use OpenTofu
--
local original = lint.linters.terraform_validate
lint.linters.terraform_validate = function()
    local linter = original()
    linter.cmd = "tofu validate"
    return linter
end

--
-- Enable linters
--
lint.linters_by_ft = {
    bash   = { "bash" },
    -- python = { "ruff" },
    yaml   = { "yamllint" },
}
