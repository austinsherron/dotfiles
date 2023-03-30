require 'xplr.lua.config.appearance.icons'
require 'xplr.lua.utils.meta'


-- required for plugin manager
version = xplr_version()

local pm = require 'xplr.lua.utils.pluginmanager'
local plugins = require 'xplr.lua.plugins'

pm.init(plugins)
