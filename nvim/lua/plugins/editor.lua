return {

  {
    "rainbowhxch/accelerated-jk.nvim",
    lazy = true,
    event = "VimEnter",
    config = require("config.accelerated-jk"),
  },

  {
    "mg979/vim-visual-multi",
    lazy = true,
    event = "BufEnter",
    config = require("config.accelerated-jk"),
  },

  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      local Rule = require("nvim-autopairs.rule")
      local npairs = require("nvim-autopairs")
      npairs.get_rule("`").not_filetypes = { "verilog", "systemverilog" }
      npairs.get_rule("'").not_filetypes = { "verilog", "systemverilog" }
      -- npairs.add_rules({
      --   Rule("`", "`"):with_pair(function(opts_backtick_rule)
      --     print(vim.inspect(opts_backtick_rule))
      --     if opts_backtick_rule.line == "" then
      --       -- don't add pair on that line
      --       return false
      --     end
      --   end),
      -- })
      npairs.add_rules({
        Rule("$", "$", "tex"):with_pair(function(opts_dollar_rule)
          print(vim.inspect(opts_dollar_rule))
          if opts_dollar_rule.line == "aa $$" then
            -- don't add pair on that line
            return false
          end
        end),
      })
      -- npairs.remove_rule("`") -- remove rule for `
      -- npairs.clear_rules() -- clear all rules
      -- setup cmp for autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
