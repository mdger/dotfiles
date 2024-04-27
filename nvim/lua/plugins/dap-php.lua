return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      php = function(config)
        config.configurations = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug 9005",
            port = 9005,
            pathMappings = {
              -- For some reason xdebug sometimes fails for me, depending on me
              -- using herd or docker. To get it to work, change the order of the mappings.
              -- The first mapping should be the one that you are actively using.
              -- This only started recently, so I don't know what changed.
              ["/opt/meteoviva"] = "${workspaceFolder}",
              -- ["${workspaceFolder}"] = "${workspaceFolder}",
              -- ["/var/www/html"] = "${workspaceFolder}",
            },
          },
        }
        require("mason-nvim-dap").default_setup(config) -- don't forget this!
      end,
    },
    ensure_installed = {
      "php",
    },
  },
}
