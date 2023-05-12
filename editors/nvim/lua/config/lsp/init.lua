require 'lib.lua.table'
require 'nvim.lua.config.lsp.keymappings'


local LSP_SERVERS = { 'bashls', 'lua_ls', 'pyright' }

function lsp_servers()
  return LSP_SERVERS
end


local function get_config_for_server(lsp_server)
    return require('nvim.lua.config.lsp.servers.' .. lsp_server)
end


-- TODO: would like better code organization here
function navic_on_attach(client, bufnr)
  local navic = require('nvim-navic')

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end


local function init_lsp_servers(lspconfig)
  for _, lsp_server in ipairs(LSP_SERVERS) do
    local config = get_config_for_server(lsp_server)
    table.combine(config, { on_attach = navic_on_attach })

    lspconfig[lsp_server].setup(config)
  end
end


function lspconfig_config()
  local lspconfig = require('lspconfig')

  init_lsp_servers(lspconfig)
  lsp_keymappings()
end

