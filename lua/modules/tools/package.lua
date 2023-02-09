local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = conf.telescope,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
})

package({
    'glepnir/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
})

package({
    'williamboman/mason.nvim',
    config = conf.mason,
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim', config = conf.mason_lspconfig },
        { 'neovim/nvim-lspconfig',             config = conf.lspconfig },
        { 'glepnir/lspsaga.nvim',              config = conf.lspsaga },
    },
})

package({ 'CRAG666/code_runner.nvim', config = conf.code_runner })

package({ 'windwp/nvim-autopairs', config = conf.autopairs })
package({ 'hoob3rt/lualine.nvim', config = conf.lualine })
package({ 'numToStr/Comment.nvim', config = conf.Comment })
package({ 'karb94/neoscroll.nvim', config = conf.neoscroll })
package({ 'ethanholz/nvim-lastplace', config = conf.lastplace })
package({ 'lukas-reineke/indent-blankline.nvim', config = conf.indent_blankline })
package({ 'lewis6991/gitsigns.nvim', config = conf.gitsigns })
