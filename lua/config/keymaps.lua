-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("carlosdanieldev.discipline")

discipline.cowboy()

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "dw", "vb_d")

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "<C-m>", "<C-i>", opts)

keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":BufferLineCycleNext<Return>", opts)
keymap.set("n", "<s-tab>", ":BufferLineCyclePrev<Return>", opts)

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "C-w>+")
keymap.set("n", "<C-w><down>", "C-w>-")

keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
