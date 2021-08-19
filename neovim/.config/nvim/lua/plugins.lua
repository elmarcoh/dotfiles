local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- color schemes
    -- use {'sonph/onehalf', rtp="vim", opt=true, as="onehalf"}
    -- use 'tomasr/molokai'
    -- use 'Th3Whit3Wolf/one-nvim'
    -- use 'drewtempelmeyer/palenight.vim'
    use 'folke/tokyonight.nvim'

    use 'jiangmiao/auto-pairs'

    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    use 'nvim-lua/completion-nvim'

    use {
      'hoob3rt/lualine.nvim',
      requires = {
        {'kyazdani42/nvim-web-devicons', opt = true},
        -- {'nvim-lua/lsp-status.nvim', opt = true},
      }
    }
    -- This makes diagnostics to lose color and underlines :'(
    -- use 'nvim-lua/lsp-status.nvim'
    require('plugconf.lualine')


    use 'tpope/vim-fugitive'

    -- All this for telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'tpope/vim-surround'

    use 'b3nj5m1n/kommentary'
    require('plugconf.kommentary')

    use 'mhinz/vim-startify'
    require 'plugconf.startify'

    -- plugin configs
    require('plugconf.telescope')

    use 'metakirby5/codi.vim'
end)
