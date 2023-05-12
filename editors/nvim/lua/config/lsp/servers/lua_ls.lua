local path = require('path')

local env = require('lib.lua.env')
local stream = require('lib.lua.stream')

require 'lib.lua.string'
require 'lib.lua.table'


local function get_lua_path_components()
  local lua_path = env.lua_path()
  local split_lua_path = string.split(lua_path, ';')

  return stream(split_lua_path)
    :filter(function(i) return i ~= "" end)
    :get()
end


local function make_wkspace_library()
  local local_modules = stream(get_lua_path_components())
    :map(path.dirname)
    :get()

 table.insert(local_modules, '/usr/local/share/lua/5.4')
 table.insert(local_modules, '/usr/local/bin/lua')

 return local_modules
end


return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      runtime = {
        version = 'Lua 5.4',
        path = get_lua_path_components(),
      },
      workspace = {
        library = make_wkspace_library(),
      }
    }
  }
}

