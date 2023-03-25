-- move these to shared utils

local function get_data_path()
    return os.getenv('HOME' .. '/.local/share')
end


local function update_pkg_path(paths)
    for _, path in ipairs(paths) do
        package.path = package.path .. ';' .. path .. '/?.lua'
    end
end


local function run(cmd)
    return os.execute(cmd)
end


local function git_clone(url, path)
    local cmd = string.format("[ -e '%s' ] || git clone '%s' '%s'", path, url, path)
    return run(cmd)
end


local MGR_GIT_URL = 'https://github.com/dtomvan/xpm.xplr'
local MGR_PATH = '/.local/share/xplr/dtomvan/xpm.xplr'

local function init()
    git_clone(MGR_GIT_URL, MGR_PATH)    

    require('xpm').setup({
        plugins = {
            -- Let xpm manage itself
            'dtomvan/xpm.xplr',
            { name = 'sayanarijit/fzf.xplr' },
        },
        auto_install = true,
        auto_cleanup = true,
    })
end


return {
    name = 'xpm',
    init = init
}
