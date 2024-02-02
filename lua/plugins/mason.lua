local externals = require("config.externals")

return {
	{
		"williamboman/mason.nvim",
		name = "mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason-lspconfig",
		opts = {
			ensure_installed = externals.lsps,
      automatic_installation = true,
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
    event = 'BufReadPre',
		dependencies = {
			"mason",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local installer = require("mason-tool-installer")

			installer.setup({
				ensure_installed = externals.formatters,
			})
		end,
		dependencies = {
			"mason",
		},
	},
}
