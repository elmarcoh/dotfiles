function lspStatus()
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    local err_count = vim.lsp.diagnostic.get_count(0 ,'Error')
    local wrn_count = vim.lsp.diagnostic.get_count(0 ,'Warning')
    return ":".. wrn_count .. "  :" .. err_count
  end
end


require'lualine'.setup{
  options={
    theme='dracula',
    section_separators='', component_separators='',
  },

  sections = {
    lualine_c = {
      {
        'diagnostics',
        -- table of diagnostic sources, available sources:
        -- nvim_lsp, coc, ale, vim_lsp
        sources = {"nvim_lsp"},
        -- displays diagnostics from defined severity
        sections = {'error', 'warn', 'info', 'hint'},
        -- all colors are in format #rrggbb
        --[[ color_error = nil, -- changes diagnostic's error foreground color
        color_warn = nil, -- changes diagnostic's warn foreground color
        color_info = nil, -- Changes diagnostic's info foreground color
        color_hint = nil, -- Changes diagnostic's hint foreground color ]]
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      }
    }
  }
}
