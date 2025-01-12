return {

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {

      "williamboman/mason.nvim",
      opts = { ensure_installed = {
        "php-debug-adapter",
      } },
    },
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      -- dap.adapters.php = {
      --   type = "executable",
      --   command = "node",
      --   args = { path .. "/extension/out/phpDebug.js" },
      -- }
    end,
  },
}
