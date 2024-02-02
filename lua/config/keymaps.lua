local keymap = vim.keymap
local g = vim.g
local mapping_options = {
  noremap = true,
	silent = true,
}

g.mapleader = " "
keymap.set("n", "<Space>", "")

-- Directory Navigation
keymap.set(
	"n",
	"<C-n>",
	":Neotree position=left toggle=true source=filesystem reveal_force_cwd=true<CR>",
	mapping_options
)
keymap.set("n", "<leader>e", ":Neotree position=left source=filesystem reveal_force_cwd=true<CR>", mapping_options)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", mapping_options)
keymap.set("n", "<C-j>", "<C-w>j", mapping_options)
keymap.set("n", "<C-k>", "<C-w>h", mapping_options)
keymap.set("n", "<C-l>", "<C-w>l", mapping_options)

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", mapping_options)
keymap.set("n", "<leader>sh", ":split<CR>", mapping_options)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", mapping_options)

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Global mappings.
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Restart lsp server
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { silent = true, noremap = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
