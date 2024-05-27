return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          env = function()
            -- read from .vscode/settings.json
            local neoconf = require("neoconf")
            -- local confArgs = neoconf.get("phpunit.args")
            local confArgs = neoconf.get("phpunit.args", nil, { buffer = vim.api.nvim_get_current_buf() })
            local confCmd = neoconf.get("phpunit.command", nil, { buffer = vim.api.nvim_get_current_buf() })

            local phpunitArgs = ""
            for _, value in ipairs(confArgs) do
              phpunitArgs = phpunitArgs .. " " .. value
            end

            local cmdTbl = vim.split(confCmd, " ")
            local bin = "vendor/bin/phpunit " .. phpunitArgs
            local containerName = cmdTbl[#cmdTbl]
            print(bin)
            return {
              CONTAINER = containerName,
              REMOTE_PHPUNIT_BIN = bin,
            }
          end,
          phpunit_cmd = function()
            return "/home/mg/.config/nvim/bin/dphpunit"
          end,
          root_files = { "tests/phpunit.xml" },
        },
      },
    },
  },
}
