return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    opts = {

      consumers = {
        overseer = require("neotest.consumers.overseer"),
      },
      output = {
        open_on_run = false,
      },
      output_panel = {
        enabled = true,
      },
      quickfix = {
        enabled = false,
      },
      adapters = {
        ["neotest-phpunit"] = {
          env = function()
            local path = vim.fn.getcwd() .. "/.vscode/settings.json"
            local json = require("scripts/json").getconfigs(path)
            local confArgs = json["phpunit.args"]
            local confCmd = json["phpunit.command"]

            local phpunitArgs = ""
            for _, value in ipairs(confArgs) do
              phpunitArgs = phpunitArgs .. " " .. value
            end

            local cmdTbl = vim.split(confCmd, " ")
            local bin = "vendor/bin/phpunit " .. phpunitArgs
            local containerName = cmdTbl[#cmdTbl]

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
