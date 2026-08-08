(import-macros {: set! : set+} :hibiscus.vim)

(local M
  {1 :nvim-treesitter/nvim-treesitter
   :lazy false
   :dependencies [{1 :nvim-treesitter/nvim-treesitter-textobjects }]
   :build ":TSUpdate"})

(fn M.config []
  (local ts (require :nvim-treesitter))
  (ts.install [:python :markdown :markdown_inline :c :cpp :cuda :zig :rust :dockerfile :diff :fennel :json :yaml :toml :sql]))

M
