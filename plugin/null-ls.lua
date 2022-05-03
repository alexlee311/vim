local null_ls = require("null-ls")

local builtins = null_ls.builtins
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting

local sources = {
  -- Diagnostics
  diagnostics.chktex.with({
    -- Execute \input statements
    extra_args = { "-I" },
  }),
  diagnostics.flake8,
  diagnostics.mdl,
  diagnostics.selene,
  diagnostics.shellcheck,

  -- Formatting
  formatting.black,
  formatting.google_java_format,
  formatting.shfmt.with({
    -- Indent with 4 spaces
    extra_args = { "-i", "4" },
  }),
  formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
  }),
  formatting.trim_newlines,
  formatting.trim_whitespace,
}

-- Format on save
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(clients)
      -- filter out clients that you don't want to use
      return vim.tbl_filter(function(client)
        local filtered_clients = { "jdtls", "texlab" }
        for _, filtered_client in ipairs(filtered_clients) do
          if client.name == filtered_client then
            return false
          end
        end
        return true
      end, clients)
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
