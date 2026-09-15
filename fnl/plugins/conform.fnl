(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [ (gh :stevearc/conform.nvim) ])

(local conform (require :conform))
(conform.setup {:formatters_by_ft {:fennel [:fnlfmt] :python [:isort :black]}})
(map! [n] :<leader>bf
    (fn []
      (conform.format {:lsp_fallback true :async true :timeout_ms 500})))


