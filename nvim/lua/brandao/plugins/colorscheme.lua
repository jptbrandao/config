-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
    priority = 1000,
	name = "rose-pine",
	config = function()
        require("rose-pine").setup({
            variant = 'moon',
            dark_variant = 'main',
            bold_vert_split = false,
            dim_nc_background = true,
            disable_background = false,
            disable_float_background = true,
            disable_italics = true,
        })
		vim.cmd("colorscheme rose-pine")
	end
}
