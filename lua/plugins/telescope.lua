return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    {
      "dawsers/telescope-file-history.nvim",
      config = function()
        require("file_history").setup({
          backup_dir = "~/.file-history-git",
          git_cmd = "git",
        })
      end,
    },
  },
  config = function()
    local telescope = require('telescope')
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    telescope.setup({
      extensions = {
        fuzzy = false,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    })

    telescope.load_extension('fzf')
    telescope.load_extension('live_grep_args')
    telescope.load_extension('file_history')

    keymap.set('n', '<leader>ff', builtin.find_files, {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})
    keymap.set('n', '<leader>fw', telescope.extensions.live_grep_args.live_grep_args, {})
    keymap.set("n", "<leader>gt", builtin.git_status, {})
    keymap.set("n", "<leader>fgb", builtin.git_branches, {})
    keymap.set("n", "<leader>fgs", builtin.git_stash, {})
    keymap.set("n", "<leader>fr", builtin.resume, {})
  end
}
