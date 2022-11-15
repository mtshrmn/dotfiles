local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

local config = {

	header = {
		"⠈⠻⢿⣿⣿⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠤⠤⠐⠒⠒⠰⠒⠒⠤⠤⢄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠛⢿⣿⣿⣿⣿⣿⣿⣶⣤⣀⡀⠀⢐⡶⠖⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⠀⠀⠀⠙⢢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⣿⣿⣦⣀⠀⠀⠀⠀⠙⠿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢄⠠⡀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠹⣿⣿⣿⣷⣦⣀⠀⠀⠀⢀⠏⠀⠀⠀⠀⠀⠀⠀⢀⠀⠄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠠⡀⢀⠑⡀⠀⠑⢌⠢⡀⠐⡡⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠈⢿⣿⣿⣿⣿⣷⣦⣠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠘⡀⠀⠈⠙⠢⢄⠀⠀⠀⠀⠀⠀⠀⠈⠢⡑⢜⢄⢀⠀⠱⡙⢄⠈⢊⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠙⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⠀⠀⠀⠀⠀⠈⠒⢄⡀⠀⠀⠀⠀⠂⠈⠀⢆⢲⠁⡢⣈⢀⠢⡢⠡⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠈⠻⣿⣿⠃⠀⠀⠀⠀⠀⠀⠠⠁⠀⠀⠀⠈⡆⠀⡀⡀⠀⠀⠀⠀⠉⣓⠄⡀⠀⢀⠑⠑⣌⠋⢳⡈⢪⠳⣧⠱⡡⠳⠣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⢈⠇⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⢰⣐⠎⠀⠀⠀⠀⢀⣴⠞⢃⢘⡐⢄⡀⠠⡈⠢⣄⠱⣌⡰⠀⠣⡘⡤⣃⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⢀⠏⡀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⡇⠀⠏⠘⠻⠀⠎⣴⢿⠝⣋⣟⡃⠀⠀⠈⠢⡈⠑⢌⠓⢌⠳⡸⠃⠹⡜⡝⡞⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⡌⣰⡇⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⡄⠀⠘⡀⢸⠸⣦⠏⢎⡪⡃⠀⢀⢠⠀⠀⠀⠀⠑⢄⠈⠪⡳⡙⣆⣼⠱⡌⣷⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⡸⢰⠻⡃⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠃⠀⠀⢃⠀⠀⠛⠀⠔⠀⠀⢀⠂⠂⠁⠀⠀⠀⠀⠀⠑⢕⢈⠪⡪⣣⡇⢱⠸⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⢠⢡⢃⡇⠂⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⡄⠀⡄⠈⡀⠀⠀⠀⠀⠀⡠⡁⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⡀⡈⢪⡳⡄⡆⣵⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠇⡌⢸⠃⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⡇⡇⣧⠀⠇⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡏⢞⢄⠱⡜⢧⠋⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⡸⢰⠀⣼⢸⠀⠀⠀⠀⠀⠀⢸⢸⠀⠀⠀⠀⠀⡇⡇⣿⠀⢸⠀⠀⠠⡒⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⡆⢸⡟⡄⡘⣄⠑⣥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⢀⠃⡏⠀⡟⢸⠀⠀⠀⠀⠀⠀⢸⠈⠀⠀⠀⠀⠀⠁⢟⠹⠂⢘⡀⣀⡀⡁⠀⠀⠀⠀⢀⠔⡟⠀⠀⠀⠀⠀⠀⠀⡇⠀⢿⠹⡕⡘⡄⠌⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⢸⢠⠁⢠⡇⢸⠀⠀⢠⠀⠀⠀⢸⠀⠀⠀⠀⠀⢰⢰⢸⢐⢰⠀⡇⠀⠀⠈⠀⠀⣠⠞⣵⡷⠀⠀⠀⠀⠀⠀⠀⢠⠁⠀⠈⣇⠰⡰⢩⠌⡌⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⡏⢸⠀⢸⡇⠈⠀⠀⢸⠀⠀⠀⠸⠀⠀⠀⠀⠀⠘⡈⣼⠈⢸⢠⠃⠀⠀⠀⠀⡜⣣⡽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⠀⠸⡄⠇⢺⡘⡜⡘⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⡇⣼⠀⢸⡧⠀⠀⠀⢸⠀⠀⠀⢸⢠⡆⠀⠀⠀⡆⢇⣿⢸⡇⡶⡀⠀⠀⠀⠰⠷⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⠀⠀⢻⣼⢸⢡⠴⣱⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⡇⣿⠀⢸⢁⠀⠀⠀⢸⠀⠀⠀⠸⠈⠇⠀⠀⠀⠹⠸⠘⠣⣣⢃⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠋⢿⠀⢞⠴⡎⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⢠⢹⠀⢸⣤⠄⠀⠀⢨⠀⠀⠀⠀⢸⠀⢀⠀⢸⢧⡇⣠⠇⡄⡍⡳⣦⣀⣀⣀⠀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⣦⣱⢇⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠈⡜⡆⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⡜⢠⠈⠀⠀⠈⡆⠸⡸⢙⠌⠪⡪⠢⡀⠈⠉⡽⠉⡛⢍⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿⣷⡖⠒⢖⡦⠉⠈⠉⠒⠒⠒⠉⠉⠉⠉",
		"⠀⠀⠐⣵⡀⡇⣀⠀⠀⢀⠀⠀⡄⣀⣇⣼⡀⡄⠀⡆⣄⡀⢣⢣⢮⠢⣈⠐⠮⣲⣄⣰⣵⠿⠋⠱⡀⡀⠀⠀⠀⠀⠀⠀⠀⢈⠁⠀⠀⠀⠀⠀⠀⢠⣿⣿⡧⢢⠟⠀⢀⡔⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠙⣕⠇⠀⠀⠀⠀⠀⡅⡇⠀⠠⠃⠆⠃⠀⢃⣄⠂⠬⠬⠮⠦⠡⠥⠶⣲⣿⠉⠀⠀⠀⠀⠈⡄⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⡀⠤⢐⣿⣿⠗⠃⡠⠐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠐⢅⢸⠀⠀⡆⠀⡇⡇⠀⠀⠸⢰⠼⠊⠁⠀⠀⠀⠀⠀⠀⠐⠠⡀⠈⠉⠓⠢⢄⡀⠀⠚⠀⠈⠡⣄⠀⠀⠀⠀⠘⠠⠤⠒⠊⠁⠀⢀⡨⠞⠁⠔⠊⠀⠀⠀⠀⠀⠀⣀⠔⠁⠀⠀⠀",
		"⠀⠀⠀⠀⠀⢸⢸⠀⠀⠀⠀⠁⠃⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠂⠄⣀⠀⠈⠉⠒⠠⠤⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠔⠉⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠈⠀⠀⠀⠀⠀⠄",
		"⠀⠀⠀⠀⠀⢸⡆⠀⠀⣶⠀⢀⢠⢀⠎⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠒⠤⢄⣀⡀⠀⠈⠉⠉⠉⠉⡉⡉⢍⠄⠀⠀⠀⠀⠀⢒⠄⢀⠀⠀⡇⡐⠀⠀⡠⠂⠁⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠘⡇⠀⠀⡏⠀⢸⢸⠘⠀⠀⠀⠀⠀⠂⢲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠨⡊⠀⠁⠀⠀⠀⠀⠀⠀⠈⡀⢸⠀⠀⠈⠀⢀⡐⠀⠀⠀⠀⡠⠊",
		"⠀⠀⠀⠀⠀⠀⡇⠁⠀⡇⡇⡆⡆⡇⠀⠀⠀⠀⠀⠐⢺⠀⠀⠀⢆⠦⢊⠄⠀⠀⡀⠤⢀⠄⠀⠀⠀⠀⠀⠀⠀⠀⡠⡪⡠⠊⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡄⡗⠶⣄⠀⠀⠀⠀⠀⡠⠊⠀⠀",
		"⠀⠀⠀⠀⠀⠀⡇⠀⠀⡇⢠⢡⢁⡇⠀⠀⠀⠀⠀⠀⠀⠁⠂⠀⠀⠑⠀⠀⠈⢀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢊⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠣⢀⠀⠛⠓⠒⠒⠦⠤⡀⠀⢀",
		"⠀⠀⠀⠀⠀⠀⢸⠀⠀⡿⠈⡌⡜⢰⠀⠀⠀⠀⠑⠤⡀⠀⠀⠀⠇⠀⣗⠅⠪⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⡕⠁⠀⠀⠀⠀⠀⠀⠀⠀⠰⠒⠒⠐⠄⠀⠈⠑⢤⡀⠀⠀⠀⠀⠈⠑⠥",
		"⠀⠀⠀⠀⠀⠀⢸⠀⠀⣣⢁⢃⢁⢸⠀⠀⠀⠀⠀⠀⠀⠁⠢⡀⠀⢘⠅⡈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⡐⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⢂⠀⠀⠀⠈⠑⢧⡀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠈⡇⠀⡇⢎⠞⡜⡜⡄⠀⠈⠳⣄⠀⠀⠈⠲⡈⢢⠔⠈⢀⠤⠒⠒⠒⠒⠂⠈⠉⠉⠁⠀⠀⢰⠲⠈⠁⢁⠤⠒⠀⠀⠀⠀⠀⠀⠀⠀⠐⡄⠀⠈⢆⠀⠀⠀⠀⠀⠳⡀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⡇⠀⠃⠈⡌⢦⢡⠇⠀⠀⠀⠀⠑⠢⢄⠀⢀⠄⠀⠀⠁⠀⠀⠒⠀⠉⠄⠀⠀⠀⠀⢀⠌⠁⠃⡠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⠀⠀⠈⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⢹⠀⠂⡆⠘⡜⢇⢳⠀⠐⠀⠀⠀⠂⠀⣽⠎⠀⡀⠀⢀⠎⠀⠀⠀⡘⠀⠀⠀⠀⠀⠆⠀⠀⠞⠒⠒⠒⠢⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀",
	},

  -- Set colorscheme
  colorscheme = "two-firewatch",
  -- colorscheme = "onedark",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = false,
    ts_rainbow = true,
    ts_autotag = true,
    luasnip = false,
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
    { "rakr/vim-two-firewatch" },
    { "mboughaba/i3config.vim" },
    { "lervag/vimtex" },
    {
      "numirias/semshi",
      ft = "python",
    },
    {
      "neoclide/coc.nvim",
      branch = "release",
    },
    -- {
      -- "tzachar/cmp-tabnine",
      -- run = "./install.sh",
      -- requires = "hrsh7th/nvim-cmp",
    -- },
    { "anuvyklack/pretty-fold.nvim",
   		config = function()
      	require('pretty-fold').setup()
   		end
		},
    { "chentau/marks.nvim" },
    { "mfussenegger/nvim-dap" },
    { "onsails/lspkind.nvim" },
    { "leafgarland/typescript-vim" },
    { "HerringtonDarkholme/yats.vim" },
    { "maxmellon/vim-jsx-pretty" },
		{ "navarasu/onedark.nvim" },
		{ "mfussenegger/nvim-treehopper" },
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    bufferline = {
      options = {
        buffer_close_icon = "",
      }
    },
    onedark = {
    	style = "deep",
    	transparent = true,
    	code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none"
    	},
    }
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    sources = {
      { name = "cmp_tabnine" },
    },
    source_priority = {
      tabnine = 1000,
      nvim_lsp = 850,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
    formatting = {
		  format = function(entry, vim_item)
			  vim_item.kind = require("lspkind").presets.default[vim_item.kind]
			  local menu = source_mapping[entry.source.name]
			  if entry.source.name == 'cmp_tabnine' then
				  if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					  menu = entry.completion_item.data.detail .. ' ' .. menu
				  end
				  vim_item.kind = ''
			  end
			  vim_item.menu = menu
			  return vim_item
		  end
	  },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server.name].setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local map = vim.keymap.set
    local set = vim.opt
    -- Set options
    set.relativenumber = true

    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>")
    map("n", "<C-s>", ":w!<CR>")
    map("n", "gd", ":<C-U>call CocActionAsync('jumpDefinition')<CR>")
    map("n", "gr", ":<C-U>call CocActionAsync('jumpReferences')<CR>")

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    vim.api.nvim_create_autocmd("VimEnter * colorscheme two-firewatch", {
      command = [[
        hi Normal guibg=NONE ctermbg=NONE
        highlight! link SignColumn LineNr
        hi CursorLine guibg=NONE ctermbg=NONE
        hi CocHintSign guifg=#555555
        hi CocInlayHint guifg=#555555 guibg=NONE

      ]]
    })
    vim.api.nvim_create_autocmd("InsertEnter", {
      command = 'let @/=""'
    })

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

    vim.cmd [[
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mod=0
    set conceallevel=1
    let g:tex_conceal='abdmg'
    let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
    ]]


    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
