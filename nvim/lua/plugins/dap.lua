return {
    {
        "mfussenegger/nvim-dap",

        keys = {
            {
                "<F2>",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Continue",
            },
            {
                "<F4>",
                function()
                    require("dap").continue({ before = get_args })
                end,
                desc = "Run with Args",
            },
            {
                "<leader>dC",
                function()
                    require("dap").run_to_cursor()
                end,
                desc = "Run to Cursor",
            },
            {
                "<F7>",
                function()
                    require("dap").step_into()
                end,
                desc = "Step Into",
            },
            {
                "<F6>",
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<F8>",
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
        },
    },
}
