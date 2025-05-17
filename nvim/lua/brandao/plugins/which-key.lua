return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true 
        vim.o.timeoutlen = 800
    end,
    opts = {
        -- leaving it empty to use default settings
    }
}
