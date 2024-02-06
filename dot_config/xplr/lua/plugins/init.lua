require 'xplr.lua.plugins.config.find'


function extra_icons_after()
  xplr.config.general.table.row.cols[2] = { format = 'custom.icons_dtomvan_col_1' }
end


function fzf_setup()
  require('fzf').setup({
    mode = 'default',
    key = 'ctrl-f',
    bin = 'fzf',
    args = "--preview 'pistol {}'",
    recursive = false,  -- If true, search all files under $PWD
    enter_dir = true,  -- Enter if the result is directory
  })
end


function material_landscape_setup() 
  require('material-landscape').setup({
    keep_default_layout = true
  })
end


function nvim_ctrl_setup()
  require('nvim-ctrl').setup({
    bin = 'nvim-ctrl',
    mode = 'default',
    keys = {
      ['ctrl-e'] = 'tabedit',
      ['o'] = 'e',
    }
  })
end


function zentable_setup()
  require('zentable').setup()
end


function zoxide_setup()
  require('zoxide').setup({
    bin = 'zoxide',
    mode = 'default',
    key = 'Z',
  })
end


return {
  -- package manager
  'dtomvan/xpm.xplr',       
  { 'dtomvan/extra-icons.xplr', after = extra_icons_after },
  { 'sayanarijit/find.xplr', setup = find_setup }, 
  { 'sayanarijit/fzf.xplr', setup = fzf_setup },
  -- { 'sayanarijit/material-landscape.xplr', setup = material_landscape_setup },
  { 'sayanarijit/nvim-ctrl.xplr', setup = nvim_ctrl_setup },
  { 'sayanarijit/tri-pane.xplr', rev = 'a194ce5' },
  { 'sayanarijit/zoxide.xplr', setup = zoxide_setup },
  { 'sayanarijit/zentable.xplr', setup = zentable_setup },
}

