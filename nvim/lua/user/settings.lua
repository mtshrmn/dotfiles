local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local set = vim.opt

local config = {

  -- Set colorscheme
  colorscheme = "two-firewatch",

  -- Add plugins
  plugins = {
    { "rakr/vim-two-firewatch" },
    { "mboughaba/i3config.vim" },
    {
      "numirias/semshi",
      ft = "python",
      config = "vim.cmd [[UpdateRemotePlugins]]"
    },
    {
      "neoclide/coc.nvim",
      branch = "release",
    },
    -- { "andweeb/presence.nvim" },
    -- {
    -- "ray-x/lsp_signature.nvim",
    -- event = "BufRead",
    -- config = function()
    -- require("lsp_signature").setup()
    -- end,
    -- },
  },

  overrides = {
    treesitter = {
      ensure_installed = { "lua" },
    },
  },

  -- On/off virtual diagnostics text
  virtual_text = true,

  -- Disable default plugins
  enabled = {
    bufferline = true,
    nvim_tree = true,
    lualine = true,
    lspsaga = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  packer_file = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
}

-- Set options
set.relativenumber = true

-- Set key bindings
map("n", "<C-s>", ":w!<CR>", opts)
map("n", "gd", ":<C-U>call CocActionAsync('jumpDefinition')<CR>", opts)
map("n", "gr", ":<C-U>call CocActionAsync('jumpReferences')<CR>", opts)

-- Set autocommands
vim.cmd [[
  augroup packer_conf
    autocmd!
    autocmd bufwritepost plugins.lua source <afile> | PackerSync
  augroup end
]]

vim.cmd [[
autocmd InsertEnter * let @/=""
]]

vim.cmd [[
function MyCustomHighlights()
    hi semshiGlobal          ctermfg=214 guifg=#e06c75
    hi semshiImported        ctermfg=214 guifg=#e06c75 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#6e88a6
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#c8ae9d
    hi semshiBuiltin         ctermfg=207 guifg=#dd672c
    hi semshiAttribute       ctermfg=49  guifg=#6e88a6
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#dd672c


    hi semshiErrorSign       ctermfg=231 guifg=#d6e9ff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#d6e9ff ctermbg=160 guibg=#d70000
    sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()
]]


return config
