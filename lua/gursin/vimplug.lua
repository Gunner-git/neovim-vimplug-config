---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Vim-plug
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Plug = vim.fn['plug#']
local vim = vim

vim.call('plug#begin')

-- Dependancy
Plug('nvim-lua/plenary.nvim')

-- Telescope
Plug('nvim-telescope/telescope.nvim')

-- Theme
Plug('ellisonleao/gruvbox.nvim')

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = function()
	vim.fn[':TSUpdate']()
end })

-- Undotree
Plug('jiaoshijie/undotree')

-- Git
Plug('tpope/vim-fugitive')

-- LSP Stuff
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x' })

-- Lualine
Plug('nvim-lualine/lualine.nvim')

-- Gitsigns
Plug('lewis6991/gitsigns.nvim')

vim.call('plug#end')
