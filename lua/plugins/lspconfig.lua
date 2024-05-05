return {
  {
    --01_For Golang
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          gopls = {
            keys = {
              -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
              { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
            },
            settings = {
              gopls = {
                gofumpt = true,
                codelenses = {
                  gc_details = false,
                  generate = true,
                  regenerate_cgo = true,
                  run_govulncheck = true,
                  test = true,
                  tidy = true,
                  upgrade_dependency = true,
                  vendor = true,
                },
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
                analyses = {
                  fieldalignment = true,
                  nilness = true,
                  unusedparams = true,
                  unusedwrite = true,
                  useany = true,
                },
                usePlaceholders = true,
                completeUnimported = true,
                staticcheck = true,
                directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                semanticTokens = true,
              },
            },
          },
        },
        setup = {
          gopls = function(_, opts)
            -- workaround for gopls not supporting semanticTokensProvider
            -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
            LazyVim.lsp.on_attach(function(client, _)
              if client.name == "gopls" then
                if not client.server_capabilities.semanticTokensProvider then
                  local semantic = client.config.capabilities.textDocument.semanticTokens
                  client.server_capabilities.semanticTokensProvider = {
                    full = true,
                    legend = {
                      tokenTypes = semantic.tokenTypes,
                      tokenModifiers = semantic.tokenModifiers,
                    },
                    range = true,
                  }
                end
              end
            end)
            -- end workaround
          end,
        },
      },
    },
    --02_Python
    {
      "neovim/nvim-lspconfig",
      dependencies = {},
      opts = {
        servers = {
          pyright = {},
          pylsp = {
            mason = false,
            settings = {
              pylsp = {
                plugins = {
                  rope_autoimport = {
                    enabled = true,
                  },
                },
              },
            },
          },
          ruff_lsp = {
            -- handlers = {
            --   ["textDocument/publishDiagnostics"] = function() end,
            -- },
          },
          -- jedi_language_server = {},
        },
        setup = {
          ruff_lsp = function()
            require("lazyvim.util").lsp.on_attach(function(client, _)
              if client.name == "ruff_lsp" then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
              end
            end)
          end,
          pyright = function()
            require("lazyvim.util").lsp.on_attach(function(client, _)
              if client.name == "pyright" then
                -- disable hover in favor of jedi-language-server
                client.server_capabilities.hoverProvider = false
              end
            end)
          end,
        },
      },
    },
    --03_Typescript & Javascript
    {
      "neovim/nvim-lspconfig",
      opts = {
        -- make sure mason installs the server
        servers = {
          ---@type lspconfig.options.tsserver
          tsserver = {
            keys = {
              {
                "<leader>co",
                function()
                  vim.lsp.buf.code_action({
                    apply = true,
                    context = {
                      only = { "source.organizeImports.ts" },
                      diagnostics = {},
                    },
                  })
                end,
                desc = "Organize Imports",
              },
              {
                "<leader>cR",
                function()
                  vim.lsp.buf.code_action({
                    apply = true,
                    context = {
                      only = { "source.removeUnused.ts" },
                      diagnostics = {},
                    },
                  })
                end,
                desc = "Remove Unused Imports",
              },
            },
            ---@diagnostic disable-next-line: missing-fields
            settings = {
              completions = {
                completeFunctionCalls = true,
              },
            },
          },
        },
      },
    },
    --04
  },
}
