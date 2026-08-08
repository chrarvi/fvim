(import-macros {: map!} :hibiscus.vim)

(fn mason-config []
  (local mason (require :mason))
  (local options {:ensure_installed [:black :isort]})
  (mason.setup options)

  (fn mason-install-all []
    (vim.cmd (.. "MasonInstall " (table.concat options.ensure_installed " "))))

  (vim.api.nvim_create_user_command :MasonInstallAll mason-install-all {})
  (map! [n] :<leader>om :<cmd>Mason<CR>))

(fn mason-lspconfig-config []
  (local mason-lspconfig (require :mason-lspconfig))
  (mason-lspconfig.setup {:ensure_installed [:rust_analyzer
                                             :clangd
                                             :ty
                                             :fennel_language_server]}))

(local M [{1 :williamboman/mason.nvim
           :config mason-lspconfig-config
           :dependencies {1 :williamboman/mason-lspconfig.nvim
                          :config mason-config}}])

M

