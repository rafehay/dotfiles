return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Go
        "gopls",
        "goimports",
        "golangci-lint",

        -- JavaScript / TypeScript
        "typescript-language-server",
        "eslint-lsp",
        "prettier",

        -- Vue
        "vue-language-server",

        -- SQL
        "sqlls",
        "sql-formatter",

        -- Docker
        "dockerfile-language-server",
        "hadolint",

        -- Markdown
        "markdownlint",
        "marksman",

        -- JSON / YAML
        "json-lsp",
        "yaml-language-server",
        "yamllint",
      },
    },
  },
}