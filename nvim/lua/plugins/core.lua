return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-flat",
    },
  },
}

-- -- add gruvbox
-- {
--   "eddyekofo94/gruvbox-flat.nvim",
--   lazy = false,
--   name = "gruvbox-flat",
--   config = require("config.gruvbox-flat"),
-- },
--
-- -- Configure LazyVim to load gruvbox
-- {
--   "L3MON4D3/LuaSnip",
--   lazy = true,
--   event = "InsertEnter",
--   keys = function()
--     return {}
--   end,
-- },
-- {
--   "rainbowhxch/accelerated-jk.nvim",
--   lazy = true,
--   event = "VimEnter",
--   config = require("config.accelerated-jk"),
-- },
-- {
--   "mg979/vim-visual-multi",
--   lazy = true,
--   event = "BufReadPost",
--   config = require("config.accelerated-jk"),
-- },
-- {
--   "dense-analysis/ale",
--   lazy = true,
--   ft = { "verilog", "systemverilog", "vhdl", "matlab" },
-- },
-- {
--   "akinsho/toggleterm.nvim",
--   lazy = true,
--   event = "BufReadPost",
--   cmd = { "ToggleTerm", "TermExec" },
--   opts = {
--     size = 10,
--     open_mapping = [[<F7>]],
--     shading_factor = 2,
--     direction = "float",
--     float_opts = {
--       border = "curved",
--       highlights = { border = "Normal", background = "Normal" },
--     },
--   },
-- },
--
-- {
--   "lmburns/lf.nvim",
--   lazy = true,
--   event = "VimEnter",
--   config = function()
--     -- This feature will not work if the plugin is lazy-loaded
--     vim.g.lf_netrw = 1
--
--     require("lf").setup({
--       escape_quit = false,
--       border = "rounded",
--       -- highlights = { FloatBorder = { guifg = require("kimbox.palette").colors.magenta } },
--     })
--
--     vim.keymap.set("n", "<leader>.", ":Lf<CR>", { desc = "LF toggle file browsing" })
--   end,
--   requires = { "plenary.nvim", "toggleterm.nvim" },
-- },
-- {
--   "windwp/nvim-autopairs",
--   lazy = true,
--   event = "InsertEnter",
--   opts = {
--     fast_wrap = {},
--     disable_filetype = { "TelescopePrompt", "vim" },
--   },
--   config = function(_, opts)
--     require("nvim-autopairs").setup(opts)
--
--     local Rule = require("nvim-autopairs.rule")
--     local npairs = require("nvim-autopairs")
--     -- npairs.get_rule("`").not_filetypes = { "verilog", "systemverilog" }
--     npairs.add_rules({
--       Rule("`", "`"):with_pair(function(opts)
--         print(vim.inspect(opts))
--         if opts.line == "" then
--           -- don't add pair on that line
--           return false
--         end
--       end),
--     })
--     npairs.add_rules({
--       Rule("$", "$", "tex"):with_pair(function(opts)
--         print(vim.inspect(opts))
--         if opts.line == "aa $$" then
--           -- don't add pair on that line
--           return false
--         end
--       end),
--     })
--     -- setup cmp for autopairs
--     local cmp_autopairs = require("nvim-autopairs.completion.cmp")
--     require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
--   end,
-- },
-- statusline
-- {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = function()
--     local icons = require("lazyvim.config").icons
--
--     local function fg(name)
--       return function()
--         ---@type {foreground?:number}?
--         local hl = vim.api.nvim_get_hl_by_name(name, true)
--         return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
--       end
--     end
--
--     local custom_gruvbox = require("lualine.themes.gruvbox-flat")
--     local custom_colors = require("gruvbox.colors")
--     custom_gruvbox.normal.a.gui = "bold"
--     custom_gruvbox.insert.a.gui = "bold"
--     custom_gruvbox.replace.a.gui = "bold"
--     custom_gruvbox.visual.a.gui = "bold"
--     custom_gruvbox.command.a.gui = "bold"
--     --
--     custom_gruvbox.normal.b.fg = custom_colors.fg
--     custom_gruvbox.insert.b.fg = custom_colors.fg
--     custom_gruvbox.replace.b.fg = custom_colors.fg
--     custom_gruvbox.visual.b.fg = custom_colors.fg
--     custom_gruvbox.command.b.fg = custom_colors.fg
--
--     -- custom_gruvbox.normal.c.bg = "#17191a"
--     -- custom_gruvbox.insert.c.bg = "#17191a"
--     -- custom_gruvbox.replace.c.bg = "#17191a"
--     -- custom_gruvbox.visual.c.bg = "#17191a"
--     -- custom_gruvbox.command.c.bg = "#17191a"
--     return {
--       options = {
--         theme = custom_gruvbox,
--         globalstatus = true,
--         disabled_filetypes = {
--           statusline = { "dashboard", "alpha", "spectre_panel" },
--           winbar = { "dashboard", "alpha", "neo-tree", "toggleterm", "spectre_panel" },
--         },
--         icons_enabled = true,
--         component_separators = "|",
--         section_separators = { left = "", right = "" },
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch" },
--         lualine_c = {
--           {
--             "diagnostics",
--             symbols = {
--               error = icons.diagnostics.Error,
--               warn = icons.diagnostics.Warn,
--               info = icons.diagnostics.Info,
--               hint = icons.diagnostics.Hint,
--             },
--           },
--           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--           { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
--           -- stylua: ignore
--           {
--             function() return require("nvim-navic").get_location() end,
--             cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
--           },
--         },
--         lualine_x = {
--           -- stylua: ignore
--           -- {
--           --   function() return require("noice").api.status.command.get() end,
--           --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--           --   color = fg("Statement")
--           -- },
--           -- -- stylua: ignore
--           {
--             function() return require("noice").api.status.mode.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--             color = fg("Constant") ,
--           },
--           { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
--           {
--             "diff",
--             symbols = {
--               added = icons.git.added,
--               modified = icons.git.modified,
--               removed = icons.git.removed,
--             },
--           },
--         },
--         lualine_y = {
--           -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
--           -- { "location", padding = { left = 0, right = 1 } },
--           { "%p%%" },
--         },
--         lualine_z = {
--           { "%l/%L:%c" },
--         },
--       },
--       winbar = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = {},
--       },
--
--       inactive_winbar = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = {
--           { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
--         },
--       },
--       extensions = { "neo-tree", "lazy", "toggleterm", "trouble" },
--     }
--   end,
-- },
-- {
--   "iamcco/markdown-preview.nvim",
--   lazy = true,
--   ft = "markdown",
--   build = ":call mkdp#util#install()",
-- },
-- {
--   "lervag/vimtex",
--   lazy = true,
--   ft = { "tex" },
--   config = function()
--     vim.cmd([[hi Conceal guifg=#a9b665]])
--   end,
--
--   -- config = require("tool.vimtex"),
-- },
--
-- {
--   "frabjous/knap",
--   lazy = true,
--   ft = { "tex" },
--   -- config = require("knap").setup(),
-- },
-- {
--   "NvChad/nvim-colorizer.lua",
--   lazy = true,
--   event = "BufReadPost",
--   config = function()
--     require("colorizer").setup({})
--   end,
-- },
-- {
--   "goolord/alpha-nvim",
--   event = "VimEnter",
--   requires = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     require("alpha").setup(require("alpha.themes.startify").config)
--   end,
-- },

-- {
--   "nathanmsmith/nvim-ale-diagnostic",
--   lazy = true,
--   event = "BufReadPost",
--   config = function()
--     require("nvim-ale-diagnostic")
--
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--       underline = false,
--       virtual_text = false,
--       signs = true,
--       update_in_insert = false,
--     })
--   end,
-- },
-- {
--   "neovim/nvim-lspconfig",
--   lazy = true,
--   event = "BufReadPost",
--   opts = function(_, opts)
--     opts.setup = {
--       hdl_checker = {
--         default_config = {
--           cmd = { "hdl_checker", "--lsp" },
--           filetypes = { "vhdl", "verilog", "systemverilog" },
--           root_dir = function(fname)
--             -- will look for the .hdl_checker.config file in parent directory, a
--             -- .git directory, or else use the current directory, in that order.
--             local util = require("lspconfig").util
--             return util.root_pattern(".hdl_checker.config")(fname)
--               or util.find_git_ancestor(fname)
--               or util.path.dirname(fname)
--           end,
--           settings = {},
--         },
--       },
--     }
--   end,
-- },
-- {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   dependencies = {
--     -- which key integration
--     {
--       "folke/which-key.nvim",
--       opts = function(_, opts)
--         if require("lazyvim.util").has("noice.nvim") then
--           opts.defaults["<leader>sn"] = { name = "+noice" }
--         end
--       end,
--     },
--   },
--   presets = {
--     command_palette = true,
--   },
--   opts = {
--     routes = {
--     },
--     lsp = {
--       override = {
--         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--         ["vim.lsp.util.stylize_markdown"] = true,
--       },
--     },
--     presets = {
--       bottom_search = true,
--       command_palette = true,
--       long_message_to_split = true,
--     },
--   },
-- -- stylua: ignore
-- keys = {
--   { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
--   { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
--   { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
--   { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
--   { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
--   { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
--   { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
-- },
-- },
-- {
--   "neovim/nvim-lspconfig",
--   --   ---@class PluginLspOpts
--   config = function()
--     if not require("lspconfig.configs").hdl_checker then
--       require("lspconfig.configs").hdl_checker = {
--         default_config = {
--           cmd = { "hdl_checker", "--lsp" },
--           filetypes = { "vhdl", "verilog", "systemverilog" },
--           root_dir = function(fname)
--             -- will look for the .hdl_checker.config file in parent directory, a
--             -- .git directory, or else use the current directory, in that order.
--             local util = require("lspconfig").util
--             return util.root_pattern(".hdl_checker.config")(fname)
--               or util.find_git_ancestor(fname)
--               or util.path.dirname(fname)
--           end,
--           settings = {},
--         },
--       }
--     end
--
--     require("lspconfig").hdl_checker.setup({})
--   end,
-- },