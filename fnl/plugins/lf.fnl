(import-macros {: map!} :hibiscus.vim)

(local M { 1 :lmburns/lf.nvim :dependencies [:akinsho/toggleterm.nvim]})

(fn M.config []
  (local lf (require :lf))
  (lf.setup {:escape_quit false :winblend 0})

  (map! [n] :<leader>or lf.start)
)

M
