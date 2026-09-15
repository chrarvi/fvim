(require :globals)
(require :bindings)
(require :options)
(require :plugins)

(let [user-file (.. (vim.fn.stdpath :config) :/lua/user/init.lua)]
  (when (> (vim.fn.filereadable user-file) 0)
    (require :user)))
