return {
  -- add gruvbox
  {
    "eddyekofo94/gruvbox-flat.nvim",
    lazy = false,
    name = "gruvbox-flat",
    config = require("config.gruvbox-flat"),
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      local custom_gruvbox = require("lualine.themes.gruvbox-flat")
      local custom_colors = require("gruvbox.colors")
      custom_gruvbox.normal.a.gui = "bold"
      custom_gruvbox.insert.a.gui = "bold"
      custom_gruvbox.replace.a.gui = "bold"
      custom_gruvbox.visual.a.gui = "bold"
      custom_gruvbox.command.a.gui = "bold"

      custom_gruvbox.normal.b.gui = "bold"
      custom_gruvbox.insert.b.gui = "bold"
      custom_gruvbox.replace.b.gui = "bold"
      custom_gruvbox.visual.b.gui = "bold"
      custom_gruvbox.command.b.gui = "bold"

      --
      custom_gruvbox.normal.b.fg = "#7c6f64"
      custom_gruvbox.insert.b.fg = "#7c6f64"
      custom_gruvbox.replace.b.fg = "#7c6f64"
      custom_gruvbox.visual.b.fg = "#7c6f64"
      custom_gruvbox.command.b.fg = "#7c6f64"

      custom_gruvbox.normal.b.bg = "#32302f"
      custom_gruvbox.insert.b.bg = "#32302f"
      custom_gruvbox.replace.b.bg = "#32302f"
      custom_gruvbox.visual.b.bg = "#32302f"
      custom_gruvbox.command.b.bg = "#32302f"
      -- custom_gruvbox.normal.c.bg = "#17191a"
      -- custom_gruvbox.insert.c.bg = "#17191a"
      -- custom_gruvbox.replace.c.bg = "#17191a"
      -- custom_gruvbox.visual.c.bg = "#17191a"
      -- custom_gruvbox.command.c.bg = "#17191a"
      return {
        options = {
          theme = auto,
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "spectre_panel" },
            winbar = { "dashboard", "alpha", "neo-tree", "toggleterm", "spectre_panel" },
          },
          icons_enabled = true,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = "" } },
          },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = {
            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = fg("Statement")
            -- },
            -- -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
            {
              -- Lsp server name .
              function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = "",
              -- color = { fg = "#ffffff", gui = "bold" },
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
            -- { "location", padding = { left = 0, right = 1 } },
            { "location" },
          },
          lualine_z = {
            { "%P/%L", separator = { left = "", right = "" } },
          },
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            -- -- stylua: ignore
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },

        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          },
        },
        extensions = { "neo-tree", "lazy", "toggleterm", "trouble" },
      }
    end,
  },
}
