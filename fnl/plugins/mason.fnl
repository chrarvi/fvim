(import-macros {: map!} :hibiscus.vim)                                                                                                                                         

(fn mason-config []                                                                                                                                                            
  ((. (require :mason) :setup) {})                                                                                                                                             
  (map! [n] :<leader>om :<cmd>Mason<CR>))

(fn mason-lspconfig-config []
  ((. (require :mason-lspconfig) :setup)
   {:ensure_installed [:rust_analyzer
                       :clangd
                       :ty
                       :fennel_language_server]}))

(fn mason-tool-installer-config []
  ((. (require :mason-tool-installer) :setup)
   {:ensure_installed [:ruff
                       :debugpy]
    :run_on_start true}))

[
 {1 :williamboman/mason.nvim
  :config mason-config}

 {1 :williamboman/mason-lspconfig.nvim
  :dependencies [:williamboman/mason.nvim]
  :config mason-lspconfig-config}

 {1 :WhoIsSethDaniel/mason-tool-installer.nvim
  :dependencies [:williamboman/mason.nvim]
  :config mason-tool-installer-config}
]
