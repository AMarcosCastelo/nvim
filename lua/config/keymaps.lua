local keymap = vim.keymap

local mapping_options = {
			noremap = true,
			silent = true,
		}
-- Directory Navigation
keymap.set(
  'n',
	'<C-n>',
	':Neotree position=left toggle=true source=filesystem reveal_force_cwd=true<CR>',
	mapping_options
)
keymap.set(
	'n',
	'<leader>e',
	':Neotree position=left source=filesystem reveal_force_cwd=true<CR>',
	mapping_options
)

-- Pane Navigation
keymap.set('n', '<C-h>', '<C-w>h', mapping_options)
keymap.set('n', '<C-j>', '<C-w>j', mapping_options)
keymap.set('n', '<C-k>', '<C-w>h', mapping_options)
keymap.set('n', '<C-l>', '<C-w>l', mapping_options)

-- Window Management
keymap.set('n', '<leader>sv', ':vsplit<CR>', mapping_options)
keymap.set('n', '<leader>sh', ':split<CR>', mapping_options)
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', mapping_options)

-- Comments
vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', { noremap = false })
vim.api.nvim_set_keymap('v', '<C-_>', 'gcc', { noremap = false })
