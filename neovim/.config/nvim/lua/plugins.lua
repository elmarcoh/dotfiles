local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath('data') .. '/site/pack/packer/opt/'

    local plugin_path = plugin_prefix .. plugin .. '/'
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd('packadd ' .. plugin) end
    return ok, err, code
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
    -- use 'wbthomason/packer.nvim'

    -- use {'sonph/onehalf', rtp="vim", opt=true, as="onehalf"}
    use 'tomasr/molokai'
    -- use 'Th3Whit3Wolf/one-nvim'
    use 'drewtempelmeyer/palenight.vim'

    use 'jiangmiao/auto-pairs'

    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    use 'nvim-lua/completion-nvim'

    use 'itchyny/lightline.vim'
    use 'tpope/vim-fugitive'

    -- All this for telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'tpope/vim-surround'
    --
    -- use 'sunjon/shade.nvim'
    -- require('plugconf.shade')

    use 'b3nj5m1n/kommentary'
    require('plugconf.kommentary')

    use 'glepnir/dashboard-nvim'
    require('plugconf.dashboard-nvim')

    -- plugin configs
    require('plugconf.telescope')
    require('plugconf.lightline')
end)

