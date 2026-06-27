(local M {1 :https://codeberg.org/andyg/leap.nvim :config true})

(fn M.config []
  (local leap (require :leap))

  (vim.keymap.set [:n :x :o] :s "<Plug>(leap-forward)")
  (vim.keymap.set [:n :x :o] :S "<Plug>(leap-backward)")
  (vim.keymap.set [:n :x :o] :gs "<Plug>(leap-from-window)"))


M

