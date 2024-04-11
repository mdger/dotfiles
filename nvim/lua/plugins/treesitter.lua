return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "php",
                "phpdoc",
                "sql",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            textobjects = {
                move = {
                    enable = true,
                    goto_next_start = { ["äf"] = "@function.outer", ["äc"] = "@class.outer" },
                    goto_next_end = { ["äF"] = "@function.outer", ["äC"] = "@class.outer" },
                    goto_previous_start = { ["öf"] = "@function.outer", ["öc"] = "@class.outer" },
                    goto_previous_end = { ["öF"] = "@function.outer", ["öC"] = "@class.outer" },
                },
            },
        },
    },
}
