return {
  { "craftzdog/solarized-osaka.nvim", "Mofiqul/dracula.nvim", "ellisonleao/gruvbox.nvim", "catppuccin/nvim" },

  lazy = true,
  priority = 1000,
  opts = function()
    return { transparent = true }
  end,

  -- add gruvbox

  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
      -- colorscheme = "catppuccin",
      -- colorscheme = "solarized-osaka",
      -- colorscheme = "gruvbox",
    },
  },
}
