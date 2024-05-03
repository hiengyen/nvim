return {
  "craftzdog/solarized-osaka.nvim",
  -- "Mofiqul/dracula.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return { transparent = true }
  end,

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}
