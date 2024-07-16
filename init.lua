---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Vim-plug
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Plug = vim.fn['plug#']
local vim = vim

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.7' })
Plug('ellisonleao/gruvbox.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug('jiaoshijie/undotree')
Plug('tpope/vim-fugitive')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x' })

vim.call('plug#end')

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Colors
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ColorMyGruvbox(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

function ColorMyRosepine(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyGruvbox()

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Treesitter
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "javascript", "python", "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
  
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
  
    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  
    highlight = {
      enable = true,
  
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Telescope
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function ()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Lsp-zero
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Fugitive
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Remaps
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.tmux/scripts/tmux-sessionizer<CR>")

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
									-- Set
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.opt.swapfile = false

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
