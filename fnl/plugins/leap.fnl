(local {: require-and : cb} (require :functions))

(vim.pack.add [(cb :andyg/leap.nvim)])
(vim.keymap.set [:n :x :o] :s "<Plug>(leap-forward)")
(vim.keymap.set [:n :x :o] :S "<Plug>(leap-backward)")
(vim.keymap.set [:n :x :o] :gs "<Plug>(leap-from-window)")
