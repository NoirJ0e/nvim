local config = {}

function config.kanagawa()
  vim.cmd('colorscheme kanagawa')
end

function config.dashboard()
  local db = require('dashboard')
  db.setup({
      theme = 'hyper',
      config = {
          week_header = {
              enable = true,
          },
          shortcut = {
              { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
              {
                  desc = ' Files',
                  group = 'Label',
                  action = 'Telescope find_files',
                  key = 'f',
              },
              {
                  desc = ' Texts',
                  group = 'Lable',
                  action = 'Telescope grep_string',
                  key = 'w',
              },
              {
                  desc = ' dotfiles',
                  group = 'Number',
                  action = 'Telescope dotfiles',
                  key = 'd',
              },
          },
      },
  })
end

function config.nvim_bufferline()
  require('bufferline').setup({
      options = {
          modified_icon = '✥',
          buffer_close_icon = '',
          always_show_bufferline = false,
      },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
      disable_netrw = false,
      hijack_cursor = true,
      hijack_netrw = true,
  })
end

function config.nvim_transparent()
  require("transparent").setup({
      enable = true, -- boolean: enable transparent
      extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups

          -- example of akinsho/nvim-bufferline.lua
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
      },
      exclude = {}, -- table: groups you don't want to clear
  })
end

return config
