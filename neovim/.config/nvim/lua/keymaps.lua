local function setKeyMaps(maps)
    for _, map in ipairs(maps) do
        vim.cmd(map)
    end
end

setKeyMaps {
    "nmap <leader>j :cnext<cr>",
    'nmap <leader>k :cprev<cr>',

    'nmap <c-j> :bnext<cr>',
    'nmap <c-k> :bprev<cr>',
}
