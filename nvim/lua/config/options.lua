-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- require("config.winbar")
-- vim.api.nvim_set_hl(0, "WinBarNC", {
--   fg = "#6a635d",
-- })
-- opt.winbar = "%=%m %t"

local opt = vim.opt
opt.relativenumber = false -- Relative line numbers
opt.spelllang = { "en", "it" }
opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Number of spaces tabs count for
opt.conceallevel = 0

local let = vim.g

let.tex_flavor = "latex"
let.vimtex_compiler_method = "latexmk"
let.vimtex_view_method = "zathura"
-- let.vimtex_fold_enabled = 0
let.vimtex_quickfix_mode = 0
let.tex_conceal = "abdmg"
let.tex_conceal_frac = true

vim.g.ale_sign_error = " "
vim.g.ale_sign_warning = " "
vim.g.ale_completion_enabled = 1
vim.g.ale_use_neovim_diagnostics_api = 1
vim.g.ale_echo_cursor = 0

-- Set the Vimwiki directory
vim.g.vimwiki_list = {
  {
    path = "~/.config/vimwiki",
    syntax = "markdown",
    ext = ".md",
  },
}
