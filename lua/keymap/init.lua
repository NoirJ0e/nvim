local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
    -- noremal remap
    -- close buffer
    { '<C-x>k',    cmd('bdelete'),                opts(noremap, silent) },
    -- save
    { '<C-s>',     cmd('write'),                  opts(noremap) },
    -- yank
    { 'Y',         'y$',                          opts(noremap) },
    -- buffer jump
    { '<S-l>',     cmd('bn'),                     opts(noremap) },
    { '<S-h>',     cmd('bp'),                     opts(noremap) },
    -- remove trailing white space
    { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
    -- window jump
    { '<Leader>h', '<C-w>h',                      opts(noremap) },
    { '<Leader>l', '<C-w>l',                      opts(noremap) },
    { '<Leader>j', '<C-w>j',                      opts(noremap) },
    { '<Leader>k', '<C-w>k',                      opts(noremap) },
    -- split window
    { 'ss',        cmd('split'),                  opts(noremap, silent) },
    { 'sv',        cmd('vsplit'),                 opts(noremap, silent) },
    -- close frame
    { '<Leader>q', cmd('quit'),                   opts(noremap, silent) },
})

imap({
    -- insert mode
    { '<C-h>', '<Bs>',  opts(noremap) },
    { '<C-e>', '<End>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
-- usage of plugins
nmap({
    -- plugin manager: Lazy.nvim
    { '<Leader>pu', cmd('Lazy update'),          opts(noremap, silent) },
    { '<Leader>pi', cmd('Lazy install'),         opts(noremap, silent) },
    -- dashboard
    { '<Leader>n',  cmd('DashboardNewFile'),     opts(noremap, silent) },
    { '<Leader>ss', cmd('SessionSave'),          opts(noremap, silent) },
    { '<Leader>sl', cmd('SessionLoad'),          opts(noremap, silent) },
    -- nvimtree
    { '<Leader>e',  cmd('NvimTreeToggle'),       opts(noremap, silent) },
    -- Telescope
    { '<Leader>b',  cmd('Telescope buffers'),    opts(noremap, silent) },
    { ';r',         cmd('Telescope live_grep'),  opts(noremap, silent) },
    { ';f',         cmd('Telescope find_files'), opts(noremap, silent) },
    -- code runner
    { '<Leader>rc', cmd('RunCode'),              opts(noremap, silent) },
    { '<Leader>rf', cmd('RunFile'),              opts(noremap, silent) },
    { '<Leader>rq', cmd('RunClose'),             opts(noremap, silent) },
    -- transparent
    { '<Leader>tr', cmd('TransparentToggle'),    opts(noremap, silent) },
    -- toggle term
    { '<C-\\>',     cmd('ToggleTerm'),           opts(silent) }
})
