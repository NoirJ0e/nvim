local config = {}

-- config server in this function
function config.nvim_lsp()
  local status, nvim_lsp = pcall(require, 'lspconfig')
  if (not status) then return end

  local protocol = require('vim.lsp.protocol')

  local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format ]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]
    end
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()


  -- lua server settings
  nvim_lsp.sumneko_lua.setup {
      on_attach = on_attach,
      settings = {
          Lua = {
              diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { 'vim' },
              },

              workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false
              },
          },
      },
  }

  -- python server settings
  nvim_lsp.pyright.setup {
      capabilities = capabilities,
  }
  nvim_lsp.marksman.setup {
      capabilities = capabilities,
  }
  nvim_lsp.jdtls.setup {}
  nvim_lsp.clangd.setup {
      capabilities = capabilities,
  }
  -- typescript
  nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", },
      cmd = { "typescript-language-server", "--stdio" }
  }

  -- beancount
  nvim_lsp.beancount.setup {
      on_attach = on_attach,
      init_options = {
          -- journal_file = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/All_In_One/Beancount/main.beancount",
          journal_file = "~/main.beancount",
      },
  }
end

function config.nvim_cmp()
  local status, cmp = pcall(require, "cmp")
  if (not status) then return end
  local lspkind = require 'lspkind'

  cmp.setup({
      snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<CR>'] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true
          }),
          ['Esc'] = cmp.mapping.close(),
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- For nvim-lsp
          { name = 'buffer' }, -- For buffer text
          -- { name = 'vsnip' }, -- For vsnip user
          { name = 'path' }, -- For path complete
          { name = 'luasnip' }, -- For luasnip
      }),
      formatting = {
          format = lspkind.cmp_format({
              wirth_text = false,
              maxwidth = 50
          })
      }
  })

  vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
end

function config.lua_snip()
  -- local ls = require('luasnip')
  -- local types = require('luasnip.util.types')
  -- ls.config.set_config({
  --   history = true,
  --   enable_autosnippets = true,
  --   updateevents = 'textchanged,textchangedi',
  --   ext_opts = {
  --     [types.choicenode] = {
  --       active = {
  --         virt_text = { { '<- choicenode', 'comment' } },
  --       },
  --     },
  --   },
  -- })
  -- require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
  require('luasnip.loaders.from_vscode').lazy_load()
  -- require('luasnip.loaders.from_vscode').lazy_load({
  --   paths = { './snippets/' },
  -- })
end

function config.lspkind()
  local status, lspkind = pcall(require, "lspkind")
  if (not status) then return end

  lspkind.init({
      -- enables text annotations
      --
      -- default: true
      mode = 'symbol',
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',
      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
      },
  })
end

function config.mason()
  local status, mason = pcall(require, "mason")
  if (not status) then return end

  mason.setup({})
end

function config.mason_lspconfig()
  local status, lspconfig = pcall(require, "mason-lspconfig")
  if (not status) then return end

  lspconfig.setup {
      ensure_installed = { "sumneko_lua", "pyright" },
  }
end

function config.lspconfig()
  local status, nvim_lsp = pcall(require, 'lspconfig')
  if (not status) then return end

  local protocol = require('vim.lsp.protocol')

  local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format ]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]
    end
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()


  -- lua server settings
  nvim_lsp.sumneko_lua.setup {
      on_attach = on_attach,
      settings = {
          Lua = {
              diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { 'vim' },
              },

              workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false
              },
          },
      },
  }

  nvim_lsp.pyright.setup {
      capabilities = capabilities,
  }
  nvim_lsp.marksman.setup {
      capabilities = capabilities,
  }
  nvim_lsp.jdtls.setup {}
  nvim_lsp.clangd.setup {
      capabilities = capabilities,
  }
  -- typescript
  nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
      cmd = { "typescript-language-server", "--stdio" }
  }
end

function config.lspsaga()
  local status, lspkind = pcall(require, "lspkind")
  if (not status) then return end

  lspkind.init({
      -- enables text annotations
      --
      -- default: true
      mode = 'symbol',
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',
      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = ""
      },
  })
end

return config
