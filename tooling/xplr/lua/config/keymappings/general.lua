require 'lib.lua.run'
km = require('xplr.lua.utils.mapper')


km.on_key('space', {
  help = 'action',
  messages = { 'PopMode', { SwitchModeBuiltin = 'action' } }
})


xplr.fn.custom.open_focused_in_editor = function(ctx)
  local focused = ctx.focused_node.absolute_path

  if (is_dir(focused)) then
    return { LogSuccess = 'Focused is dir' }
  end

  local editor = os.getenv('EDITOR')
  os.execute(editor .. ' ' .. focused)

  return { LogSuccess = 'Opening in ' .. editor }
end


km.on_key('o', {
  messages = {
    { CallLuaSilently = 'custom.open_focused_in_editor' }
  }
})

