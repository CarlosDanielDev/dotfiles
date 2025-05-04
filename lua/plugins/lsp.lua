return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        "shfmt",
        "luacheck",
        "shfmt",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },
}
