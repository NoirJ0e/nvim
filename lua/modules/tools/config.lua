local config = {}

function config.telescope()
  require('telescope').setup({
      defaults = {
          layout_config = {
              horizontal = { prompt_position = 'top', results_width = 0.6 },
              vertical = { mirror = false },
          },
          sorting_strategy = 'ascending',
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      },
      extensions = {
          fzy_native = {
              override_generic_sorter = false,
              override_file_sorter = true,
          },
      },
  })
  require('telescope').load_extension('fzy_native')
end

function config.autopairs()
  local status, autopairs = pcall(require, 'nvim-autopairs')
  if (not status) then return end
  autopairs.setup {
      disable_filetype = { 'TelescopePrompt', 'vim' }
  }
end

function config.lualine()
  require('lualine').setup {
      options = {
          icons_enabled = true,
          theme = 'auto',
          --theme = 'solarized_dark',
          -- theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {}
      },
      sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = {
              { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
                  hint = ' ' } },
              'encoding',
              'filetype'
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
      },
      inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
      },
      tabline = {},
      extensions = { 'fugitive' }
  }
end

function config.Comment()
  require('Comment').setup({})
end

function config.neoscroll()
  require('neoscroll').setup {}
end

function config.lastplace()
  require('nvim-lastplace').setup {}
end

function config.indent_blankline()
  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
  }
end

function config.gitsigns()
  require('gitsigns').setup {}
end

function config.code_runner()
  require('code_runner').setup({
      -- put here the commands by filetype
      filetype = {
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          python = "python3 -u",
          typescript = "deno run",
          javascript = "deno run",
          rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
          c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
      term = {
          position = "belowright",
          size = 12,
      },
  })
end

return config
