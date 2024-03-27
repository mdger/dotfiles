-- if true then
--     return {}
-- end

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "olimorris/neotest-phpunit",
        },
        opts = {
            adapters = {
                ["neotest-phpunit"] = {
                    env = {
                        CONTAINER = "vmvb_php_requests",
                        REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
                    },
                    phpunit_cmd = function()
                        return "/usr/local/bin/dphpunit"
                    end,
                },
            },
        },
    },
}
