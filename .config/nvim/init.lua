-- Auto install packer.nivm if not exist
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"


if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
else
  require('packer')

  -- must be loaded before any other lua plugins
  require("impatient")
end

require('packer').startup(function(use)
  require("plugins")

  if packer_bootstrap then
    require('packer').sync()
  end
end)
require("keymap")
require("settings")
require("visuals")
require("autocommands")

-- Setup lsp
require("lsp")
