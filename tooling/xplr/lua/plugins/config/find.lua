local function make_find_template(key, type_mod)
  local type_mod = type_mod and " -type " .. type_mod or ""

  return { 
    key = key,
    find_command = "find",
    find_args = ". -name " .. type_mod,
    cursor_position = 8,
  }
end


function find_setup()
  require("find").setup({
    mode = "default",
    key = "F",
    templates = {
      ["find all"] = make_find_template('a'),
      ["find files"] = make_find_template('f', 'f'),
      ["find directories"] = make_find_template('d', 'd'),
    },
    refresh_screen_key = "ctrl-r",
  })
end

