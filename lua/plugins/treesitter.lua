return {
  'nvim-treesitter/nvim-treesitter',
  build = "TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      indent = {
        enable = true,
      },
      ensure_installed = {
        'lua',
        'markdown',
        'json',
        'javascript',
        'typescript',
        'yaml',
        'html',
        'css',
        'bash',
        'dockerfile',
        'gitignore',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighthing = true
      }
    })
  end

}
