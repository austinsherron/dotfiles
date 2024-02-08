require 'xplr.lua.utils.meta'


-- plugins ---------------------------------------------------------------------

-- required for plugin manager
version = xplr_version()

require('xplr.lua.utils.pluginmanager').init('xplr.lua.plugins')

-- keymappings -----------------------------------------------------------------

require 'xplr.lua.config.keymappings.general'

-- appearance ------------------------------------------------------------------

require 'xplr.lua.config.appearance.icons'

