-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]ile' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecent file ("." for repeat)' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffer' })

      vim.keymap.set('n', '<leader>fC', function()
        builtin.colorscheme { enable_preview = true }
      end, { desc = 'Colorscheme with preview' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sf', builtin.live_grep, { desc = '[S]earch in [F]iles' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch for current [W]ord' })
      vim.keymap.set('v', '<leader>sw', builtin.grep_string, { desc = '[S]earch for current [W]ord' })
      vim.keymap.set('n', '<leader>sR', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sp', builtin.registers, { desc = '[S]earch [p]Registers' })
      vim.keymap.set('n', '<leader>sa', builtin.autocommands, { desc = '[S]earch [A]utocommands' })
      vim.keymap.set('n', '<leader>sc', builtin.command_history, { desc = '[S]earch [C]ommand history' })
      vim.keymap.set('n', '<leader>sC', builtin.commands, { desc = '[S]earch all [C]ommands' })
      vim.keymap.set('n', '<leader>sD', builtin.diagnostics, { desc = '[S]earch workspace [D]iagnostics' })
      vim.keymap.set('n', '<leader>sH', builtin.highlights, { desc = '[S]earch [H]ighlight Groups' })
      vim.keymap.set('n', '<leader>so', builtin.vim_options, { desc = '[S]earch Neovim [O]ptions' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]earches' })

      vim.keymap.set('n', '<leader>sd', function()
        builtin.diagnostics { bufnr=0 }
      end, { desc = '[S]earch document [D]iagnostics' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>sb', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[S]earch fuzzily in current [B]uffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>sB', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch fuzzily in all open [B]uffers' })

    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
