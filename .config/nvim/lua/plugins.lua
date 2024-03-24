local packer = require("packer")
packer.init({
  display = { open_fn = require("packer.util").float },
  profile = { enable = true },
})
packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("lewis6991/impatient.nvim")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("nvim-lua/lsp-status.nvim")
  use("onsails/lspkind-nvim")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("simrat39/rust-tools.nvim")
  use("kmonad/kmonad-vim")
  use{'kaarmu/typst.vim', ft = {'typst'}}
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")

      null_ls.setup({
          -- on_attach = function(client, bufnr)
          --     if client.supports_method("textDocument/formatting") then
          --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          --         vim.api.nvim_create_autocmd("BufWritePre", {
          --             group = augroup,
          --             buffer = bufnr,
          --             callback = function()
          --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          --                 vim.lsp.buf.format({ bufnr = bufnr })
          --             end,
          --         -- })
          --     end
          -- end,
          sources = {
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.formatting.black,
          },
      })
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  use{
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = "nvim-treesitter/nvim-treesitter-textobjects",
  })
  use("nvim-treesitter/playground")

  -- automatically parse indentation style
  use({
    "nmac427/guess-indent.nvim",
    config = function() require("guess-indent").setup() end,
  })

  use {
    'declancm/cinnamon.nvim',
    config = function() require('cinnamon').setup{
      default_delay = 1,
    } end
  }

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  })

  -- snippets
  use("L3MON4D3/LuaSnip")
  -- vscode-style snippets
  use("rafamadriz/friendly-snippets")

  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  })
  use({
    "cwebster2/github-coauthors.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  })
  use({
    "nvim-telescope/telescope-ui-select.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  })

  -- colorscheme
  use("RRethy/nvim-base16")

  -- notifications
  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  })

  -- surround
  use("machakann/vim-sandwich")

  -- Comment.nvim
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- indent-blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("ibl").setup({ indent = { char = "┊" }}) end
  })

  -- Icons
  use("kyazdani42/nvim-web-devicons")

  -- lualine.nvim
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- nvim-tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup()
    end,
  })

  -- A snazzy bufferline for Neovim
  use({
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- A Neovim plugin to improve buffer deletion
  use("ojroques/nvim-bufdel")

  -- autopairs for neovim
  use({
    "windwp/nvim-autopairs",
    requires = "hrsh7th/nvim-cmp",
    config = function()
      require("nvim-autopairs").setup({})
    end,
    before = "nvim-cmp",
  })

  -- interactively swap elements. Powered by treesitter
  use("mizlan/iswap.nvim")

  -- git
  use({
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
end)
