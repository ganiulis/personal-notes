---
layout: default
---

# conform.nvim—formatter plugin

## Setup

See <https://github.com/stevearc/conform.nvim>.

Sample setup:

```lua
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})
```

## Formatters

See <https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters> for a list of formatters.

Alternatively run the `:help conform.list_all_formatters` command.

- [Prettier](https://github.com/prettier/prettier) is a standard formatter for many languages and can be a good default or first-step formatter.
