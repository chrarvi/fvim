(import-macros {: set! : set+} :hibiscus.vim)

(local M {1 :nvim-treesitter/nvim-treesitter
          :event :BufReadPost
          :dependencies [:nvim-treesitter/nvim-treesitter-textobjects]
          :build ":TSUpdate"})

(fn M.config []
  (local ts (require :nvim-treesitter))
  (ts.setup {:install_dir (.. (vim.fn.stdpath :data) :/site)}))

M
