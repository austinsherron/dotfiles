require 'lib.lua.path'
require 'lib.lua.run'

local MGR_GIT_URL = 'https://github.com/dtomvan/xpm.xplr'
local MGR_PATH = get_data_path('/xplr/dtomvan/xpm.xplr')

add_module_to_lua_path(MGR_PATH)

local function init(plugins)
    all_plugins = table.combine_many(plugins)

    table.insert(all_plugins, 'dtomvan/xpm.xplr') 

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

