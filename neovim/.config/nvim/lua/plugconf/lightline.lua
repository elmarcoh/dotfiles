vim.g.lightline = { 
  colorscheme = 'palenight',
  active = {
    left = {
      {'mode', 'paste'},
      {'gitbranch', 'readonly', 'modified'},
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  }
}
