local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require("packer").startup({
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    use({"wbthomason/packer.nvim", opt = true})

    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.statusline')]]
    }

    -- Python indent (follows the PEP8 style)
    use({ "Vimjas/vim-python-pep8-indent", ft = { "python" } })

    -- Python-related text object
    use({ "jeetsukumaran/vim-pythonsense", ft = { "python" } })

    use({"machakann/vim-swap", event = "VimEnter"})

    -- File search, tag search and more
    if vim.g.is_win then
      use({"Yggdroot/LeaderF", cmd = "Leaderf"})
    else
      use({ "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" })
    end

    use {
      'nvim-telescope/telescope.nvim', cmd = 'Telescope',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- search emoji and other symbols
    use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}
    use({
        'NTBBloodbath/doom-one.nvim',
        setup = function()
                -- Add color to cursor
                vim.g.doom_one_cursor_coloring = false
                -- Set :terminal colors
                vim.g.doom_one_terminal_colors = true
                -- Enable italic comments
                vim.g.doom_one_italic_comments = false
                -- Enable TS support
                vim.g.doom_one_enable_treesitter = true
                -- Color whole diagnostic text or only underline
                vim.g.doom_one_diagnostics_text_color = false
                -- Enable transparent background
                vim.g.doom_one_transparent_background = false

                -- Pumblend transparency
                vim.g.doom_one_pumblend_enable = false
                vim.g.doom_one_pumblend_transparency = 20

                -- Plugins integration
                vim.g.doom_one_plugin_neorg = true
                vim.g.doom_one_plugin_barbar = false
                vim.g.doom_one_plugin_telescope = false
                vim.g.doom_one_plugin_neogit = true
                vim.g.doom_one_plugin_nvim_tree = true
                vim.g.doom_one_plugin_dashboard = true
                vim.g.doom_one_plugin_startify = true
                vim.g.doom_one_plugin_whichkey = true
                vim.g.doom_one_plugin_indent_blankline = true
                vim.g.doom_one_plugin_vim_illuminate = true
                vim.g.doom_one_plugin_lspsaga = false
            end,
            config = function()
            vim.cmd("colorscheme doom-one")
        end,
    })

    -- Show git change (change, delete, add) signs in vim sign column
    use({"mhinz/vim-signify", event = 'BufEnter'})
    -- Another similar plugin
    -- use 'airblade/vim-gitgutter'

    -- fancy start screen
    use { 'goolord/alpha-nvim', event = 'VimEnter', config = [[require('config.alpha-nvim')]] }

    -- Highlight URLs inside vim
    use({"itchyny/vim-highlighturl", event = "VimEnter"})

    -- Auto format tools
    -- use({ "sbdchd/neoformat", cmd = { "Neoformat" } })
    -- use 'Chiel92/vim-autoformat'
    use 'rhysd/vim-clang-format'

    -- Markdown JSON header highlight plugin
    use({ "elzr/vim-json", ft = { "json", "markdown" } })

    -- Markdown previewing (only for Mac and Windows)
    if vim.g.is_win or vim.g.is_mac then
      use({
        "iamcco/markdown-preview.nvim",
        run = function()
          fn["mkdp#util#install"]()
        end,
        ft = { "markdown" },
      })
    end

    -- Since tmux is only available on Linux and Mac, we only enable these plugins
    -- for Linux and Mac
    if utils.executable("tmux") then
      -- .tmux.conf syntax highlighting and setting check
      use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })
    end

    -- Modern matchit implementation
    use({"andymass/vim-matchup", event = "VimEnter"})

    -- Asynchronous command execution
    use({ "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } })
    -- Another asynchronous plugin
    -- Plug 'tpope/vim-dispatch'

    use({
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    })

    use({ "cespare/vim-toml", ft = { "toml" }, branch = "main" })

    -- Debugger plugin
    if vim.g.is_win or vim.g.is_linux then
      use({ "sakhnik/nvim-gdb", run = { "bash install.sh" }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] })
    end

    -- Session management plugin
    use({"tpope/vim-obsession", cmd = 'Obsession'})

    -- The missing auto-completion for cmdline!
    use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})

    -- show and trim trailing whitespaces
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}
  end,
  config = {
    max_jobs = 16,
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
  },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
