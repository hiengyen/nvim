return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "cmake",
        "cpp",
        "css",
        "gitignore",
        "graphql",
        "http",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
        --For Go
        "go",
        "gomod",
        "gowork",
        "gosum",
        --For Python
        --For Java
        --For Typescript
      })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX - Markdown
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
