require 'lib.lua.path'
require 'lib.lua.run'
require 'lib.lua.table'


local MGR_GIT_URL = 'https://github.com/dtomvan/xpm.xplr'
local MGR_PATH = get_config_path('/xplr/packages/dtomvan/xpm.xplr')

add_module_to_lua_path(MGR_PATH)
-- add_module_to_lua_path('/xplr/plugins')

function init(plugins)
    local all_plugins = table.combine({ 'dtomvan/xpm.xplr' }, plugins)

    require('xpm').setup({
        plugins = all_plugins,
        auto_install = true,
        auto_cleanup = true,
    })
end


return {
    name = 'xpm',
    init = init
}

