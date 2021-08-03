require'lualine'.setup{
  options={
    theme='dracula',
    section_separators='', component_separators='',
  },
  -- TODO enable when we are sure this doesn't remove underlines & colors
  -- from the lines containing errors
  --[[ sections = {
    lualine_c = {"os.data('%a')", 'data', require'lsp-status'.status}
  }, ]]
}
