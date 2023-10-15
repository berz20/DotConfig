return {

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    event = "InsertEnter",
    keys = function()
      return {}
    end,
  },

  {
    "dense-analysis/ale",
    lazy = true,
    ft = { "verilog", "systemverilog", "vhdl", "matlab" },
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "BufReadPost",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "nathanmsmith/nvim-ale-diagnostic",
    },
    config = function()
      -- Setup nvim-cmp.
      local cmp = require("cmp")

      local max_count = 15

      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end

      --   פּ ﯟ   some other good icons
      local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      cmp.setup({
        -- completion = {
        --   completeopt = "menu,menuone,noinsert",
        -- },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = {
            winhighlight = "FloatBorder:None,CursorLine:PmenuSel,Normal:None",
            border = border(),
            scrollbar = false,
          },
          documentation = {
            border = border(),
            winhighlight = "FloatBorder:None,CursorLine:PmenuSel,Normal:None",
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<C-y>"] = cmp.mapping.confirm({
            {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        formatting = {
          -- fields = {"abbr", "kind"},
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
              copilot = "[Copilot]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Nvim Lua]",
              nvim_lsp = "[LSP]",
              buffer = "[Buffer]",
              ale = "[ALE]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = cmp.config.sources({
          { name = "luasnip" }, -- For luasnip users.
          { name = "nvim_lsp" },
          {
            name = "nvim_lua",
            option = {
              max_item_count = max_count,
            },
          },
          {
            name = "buffer",
            option = {
              keyword_length = 1,
            },
          },
          { name = "path" },
          { name = "ale" },
          { name = "orgmode" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        formatting = {
          fields = { "kind", "abbr" },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
              buffer = "[Buffer]",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {
            name = "buffer",
            option = {
              max_item_count = max_count,
            },
          },
        },
      })
      cmp.setup.cmdline("?", {
        formatting = {
          fields = { "kind", "abbr" },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
              buffer = "[Buffer]",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {
            name = "buffer",
            option = {
              max_item_count = max_count,
            },
          },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        formatting = {
          fields = { "kind", "abbr" },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          {
            name = "path",
            option = {
              max_item_count = max_count,
            },
          },
        }, {
          {
            name = "cmdline",
            option = {
              max_item_count = max_count,
            },
          },
        }),
      })
    end,
    -- ---@param opts cmp.ConfigSchema
    -- opts = function(_, opts)
    --   local has_words_before = function()
    --     unpack = unpack or table.unpack
    --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --   end
    --
    --   local luasnip = require("luasnip")
    --   local cmp = require("cmp")

    -- opts.mapping = vim.tbl_extend("force", opts.mapping, {
    --   ["<Tab>"] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --       -- cmp.select_next_item()
    --       -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
    --       -- they way you will only jump inside the snippet region
    --     elseif luasnip.expand_or_jumpable() then
    --       luasnip.expand_or_jump()
    --     -- elseif has_words_before() then
    --     --   cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end, { "i", "s" }),
    --   ["<S-Tab>"] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --       -- cmp.select_prev_item()
    --     elseif luasnip.jumpable(-1) then
    --       luasnip.jump(-1)
    --     else
    --       fallback()
    --     end
    --   end, { "i", "s" }),
    -- })
    -- end,
  },
}
-- {
--   "hrsh7th/nvim-cmp",
--   version = false, -- last release is way too old
--   event = "InsertEnter",
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "saadparwaiz1/cmp_luasnip",
--   },
--   opts = function()
--     local cmp = require("cmp")
--     return {
--       completion = {
--         completeopt = "menu,menuone,noinsert",
--       },
--       snippet = {
--         expand = function(args)
--           require("luasnip").lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         ["<S-CR>"] = cmp.mapping.confirm({
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = true,
--         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--       }),
--       sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "buffer" },
--         { name = "path" },
--       }),
--       formatting = {
--         format = function(_, item)
--           local icons = require("lazyvim.config").icons.kinds
--           if icons[item.kind] then
--             item.kind = icons[item.kind] .. item.kind
--           end
--           return item
--         end,
--       },
--       experimental = {
--         ghost_text = {
--           hl_group = "LspCodeLens",
--         },
--       },
--     }
--   end,
-- }
