(import-macros {: map!} :hibiscus.vim)
(import-macros {: g!} :hibiscus.vim)

(local M {1 :ej-shafran/compile-mode.nvim
       :dependencies [ { 1 :nvim-lua/plenary.nvim }
                       { 1 :m00qek/baleia.nvim :tag "v1.4.0" }
                     ]})

(fn M.config [] 
  (local compile (require :compile-mode))
  (g! compile_mode {:baleia_setup true})

  (map! [n] :<leader>pc "<cmd>Compile<CR>"))

M
      
