(import-macros {: map!} :hibiscus.vim)
(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :williamboman/mason.nvim)
               (gh :williamboman/mason-lspconfig.nvim)
               (gh :WhoIsSethDaniel/mason-tool-installer.nvim)])

(require-and :mason #($.setup {}))
(map! [n] :<leader>om :<cmd>Mason<CR>)

(require-and :mason-lspconfig
             #($.setup {:ensure_installed [:rust_analyzer
                                           :clangd
                                           :ty
                                           :fennel_language_server]}))

(require-and :mason-tool-installer
             #($.setup {:ensure_installed [:ruff :debugpy] :run_on_start true}))
