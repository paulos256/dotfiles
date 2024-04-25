return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote

      -- require('mini.ai').setup { n_lines = 500 }
      require('mini.ai').setup = function()
        local ai = require("mini.ai")
        return {
          n_lines = 500,
          custom_textobjects = {
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          },
        }
      end,

      --  [[ Add/delete/replace surroundings (brackets, quotes, etc.)
      -- gsaiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- gsd}   - [S]urround [D]elete [}]quotes
      -- gsr)}  - [S]urround [R]eplace [)] [}]
      -- ]]
      require('mini.surround').setup({
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      })

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- local animate = require('mini.animate')
      -- animate.setup({
      --   cursor = {
      --     -- Animate for 200 milliseconds with linear easing
      --     timing = animate.gen_timing.linear({ duration = 200, unit = 'total' }),
      --
      --     -- Animate with shortest line for any cursor move
      --     path = animate.gen_path.line({
      --       predicate = function() return true end,
      --     }),
      --   }
      -- })

      -- require('mini.indentscope').setup = function()
      --   return {
      --     version = false, -- wait till new 0.7.0 release to put it back on semver
      --
      --     event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      --     opts = {
      --       -- symbol = "▏",
      --       symbol = "│",
      --       options = { try_as_border = true },
      --     },
      --     init = function()
      --       vim.api.nvim_create_autocmd("FileType", {
      --         pattern = {
      --           "help",
      --           "alpha",
      --           "dashboard",
      --           "neo-tree",
      --           "Trouble",
      --           "trouble",
      --           "lazy",
      --           "mason",
      --           "notify",
      --           "toggleterm",
      --           "lazyterm",
      --         },
      --         callback = function()
      --           vim.b.miniindentscope_disable = true
      --         end,
      --       })
      --     end,
      --   }
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
