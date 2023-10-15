-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds hereby

-- Custom compiler
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "matlab" },
  callback = function()
    vim.cmd([[compiler mlint]])
  end,
})

-- Custom commentstring
vim.api.nvim_create_autocmd("FileType", {
  pattern = { ".ipynb" },
  callback = function()
    vim.cmd([[setlocal commentstring=#\ %s]])
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "verilog", "systemverilog" },
  callback = function()
    vim.cmd([[setlocal commentstring=//\ %s]])
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vhdl" },
  callback = function()
    vim.cmd([[setlocal commentstring=--\ %s]])
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "matlab", "vhdl", "verilog", "systemverilog" },
  callback = function()
    vim.cmd([[setlocal omnifunc=ale#completion#OmniFunc]])
  end,
})
-- Enable vimwiki keybindings
vim.api.nvim_set_keymap("n", "<leader>wi", "<Plug>VimwikiIndex", {})
vim.api.nvim_set_keymap("n", "<leader>wt", "<Plug>VimwikiTabIndex", {})
