(import-macros {: set! : set+} :hibiscus.vim)

(local M
  {1 :nvim-treesitter/nvim-treesitter
   :branch :master
   :lazy false
   :dependencies [{1 :nvim-treesitter/nvim-treesitter-textobjects
                   :branch :master}]
   :build ":TSUpdate"})

(fn M.config []
  (local ts (require :nvim-treesitter.configs))
  (ts.setup {:ensure_installed [:python]
             :sync_install true}))

M
