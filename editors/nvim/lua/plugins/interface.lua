-- interface -------------------------------------------------------------------

--[[
  add, control, or augment interface elements; interface elements should do 
  something, or at least be informational
--]]

require 'nvim.lua.plugins.config.alphanvim'
require 'nvim.lua.plugins.config.bufferline'


return {
---- alpha: landing page
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- opts = {}, -- alphanvim_opts(),

    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
---- bufferline: buffer bar
  {
    'akinsho/bufferline.nvim',
    opts = bufferline_opts(),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = "v3.*",

    config = function(_, opts)
      require('bufferline').setup(opts)
    end,
  },
---- TODO: cmp-cmdline: fuzzy completion of commands
  {
    'hrsh7th/cmp-cmdline',
    enabled = false,
  },
---- TODO: customize: lualine: status line
  {
    'nvim-lualine/lualine.nvim',

    config = function()
      require('lualine').setup()
    end
  },
---- nvim-navic: language aware bar interace elemnt
  {
    'SmiteshP/nvim-navic',

    config = function()
      require('nvim-navic')
    end,
  },
---- undotree: visualize a file/buffer's change history
  { 'mbbill/undotree' },
}

