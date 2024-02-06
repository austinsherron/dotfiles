require 'lib.lua.run'


function xplr_version()
  return '0.21.0'
  -- return get_cmd_output("xplr --version | cut -d ' ' -f2")
end
