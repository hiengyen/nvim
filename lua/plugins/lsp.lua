return {
  {
    "williamboman/mason.nvim",
    opt = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "css-lsp",
        "taiwindcss-language-server",
      })
    end,
  },
}
