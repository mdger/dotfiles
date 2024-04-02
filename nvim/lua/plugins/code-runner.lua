return {

    {
        "CRAG666/code_runner.nvim",
        config = true,
        opts = {
            filetype = {

                -- "php": "string=$fullFileName;prefix=\"$workspaceRoot/\";docker exec hz-comm11 php -dxdebug.start_with_request=yes ${string#\"$prefix\"}",
                -- php = "docker exec hz-comm11 php -dxdebug.start_with_request=yes vmvb_test.php2 ",
                php = function()
                    return "env CONTAINER=hz-comm11 bash dphprunner"
                end,
            },
        },
    },
}
