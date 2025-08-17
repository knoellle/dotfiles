return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local opts = {
        win = {
          border = "rounded",
          wo = {
            winblend = 15,
          }
        }
      }

      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>h", desc = "Git Hunks" },
        { "<leader>g", desc = "Git" },
      })
    end,
  },
}
