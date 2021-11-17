    require('telescope').load_extension('ultisnips')
    vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope ultisnips<cr>', {noremap=true})
