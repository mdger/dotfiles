return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "phpstan" })
        end,
      },
    },
    opt = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        --   nls.builtins.code_actions.gomodifytags,
        --   nls.builtins.code_actions.impl,
        --   nls.builtins.formatting.goimports,
        --   nls.builtins.formatting.gofumpt,
        -- null_ls.builtins.formatting.phpcsfixer,
        -- null_ls.builtins.formatting.phpcbf,
        -- null_ls.builtins.diagnostics.phpcs,
        -- null_ls.builtins.diagnostics.phpmd,
        -- null_ls.builtins.diagnostics.phpstan,
      })
    end,
  },
}
