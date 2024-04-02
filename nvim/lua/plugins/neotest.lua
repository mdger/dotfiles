-- if true then
--     return {}
-- end

local currentCwd = vim.loop.cwd()
local container = nil
local remote_cmd = "vendor/bin/phpunit"

if currentCwd ~= nil and string.find(currentCwd, "mvc-cockpit", 0, true) then
    container = "cockpit-php"
    remote_cmd = "vendor/bin/phpunit -c ./tests/phpunit.xml"
end

print("neotest.lua container", container, "cmd '", remote_cmd, "'")
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
                        -- CONTAINER = "vmvb_php_requests",
                        CONTAINER = container,
                        REMOTE_PHPUNIT_BIN = remote_cmd,
                        -- REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
                    },
                    phpunit_cmd = function()
                        return "/usr/local/bin/dphpunit"
                    end,
                    root_files = { "tests/phpunit.xml" },
                },
            },
        },
    },
}
