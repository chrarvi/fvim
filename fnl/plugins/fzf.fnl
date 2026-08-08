(import-macros {: map!} :hibiscus.vim)

(local M {1 :ibhagwan/fzf-lua :dependencies [:nvim-tree/nvim-web-devicons]})

(fn M.config []
  (local fzf (require :fzf-lua))
  (fzf.setup {1 :ivy :globals { :multiprocess :true } :keymap {:fzf {:ctrl-q :select-all+accept}}})
  (map! [n] :<leader>bb fzf.buffers)
  (map! [n] :<leader>bl fzf.blines)
  (map! [n] :<leader>bL fzf.lines)
  (map! [n] :<leader>ff (fn [] (fzf.files {:cwd (vim.fn.expand "%:p:h")})))
  (map! [n] :<leader>fr fzf.oldfiles)
  (map! [n] :<leader>pf fzf.vcs_files)
  (map! [n] :<leader>/ fzf.grep_project)
  (map! [n] :<leader>le fzf.diagnostics_document)
  (map! [n] :<leader>lE fzf.diagnostics_workspace)
  (map! [n] :<leader>hh fzf.builtin)
  (map! [n] :<leader>ht fzf.helptags)
  (map! [n] :<leader>hm fzf.manpages)
  (map! [n] :<leader>hx fzf.commands)
  (map! [n] :<leader>hk fzf.keymaps)
  (map! [n] :<leader>fz fzf.zoxide))

M
