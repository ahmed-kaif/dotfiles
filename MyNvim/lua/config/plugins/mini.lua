-- lua/config/plugins/mini.lua
return {
	{
		'echasnovski/mini.nvim',
		config = function()
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }
		end
	},
	{
	  "echasnovski/mini.pairs",
	  event = "VeryLazy",
	  config = function(_, opts)
	    require("mini.pairs").setup(opts)
	  end,
	},
}
