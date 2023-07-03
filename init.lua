require('core')
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h15"
end

if vim.fn.isdirectory(vim.v.argv[2]) == 1 then
  vim.api.nvim_set_current_dir(vim.v.argv[2])
end

-- vim.cmd('colorscheme noctis_minimus')
vim.cmd('colorscheme kanagawa')
