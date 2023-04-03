require 'lib.lua.table'


-- Key Binding Handler ---------------------------------------------------------

local KeyBindingHandler = {}
KeyBindingHandler.__index = KeyBindingHandler

function KeyBindingHandler.new()
  local this = {}
  setmetatable(this, KeyBindingHandler)
  return this
end


local function do_binding(typ, key, binding)
  xplr.config.modes.builtin.default.key_bindings[typ][key] = binding
end


function KeyBindingHandler:__index(typ)
  return function(key, binding) do_binding(typ, key, binding) end
end

return KeyBindingHandler.new()

-- Factory ---------------------------------------------------------------------

-- local BindingHandlerFactory = {}
--
--
-- function BindingHandlerFactory.key()
--     return KeyBindingHandler
-- end
--
--
-- return BindingHandlerFactory

