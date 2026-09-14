(import-macros {: map!} :hibiscus.vim)
(local {: gh} (require :functions))

(vim.pack.add [(gh :cbochs/grapple.nvim)])

(local grapple (require :grapple))
(grapple.setup {:icons false :scope :git_branch})
(map! [n] "<leader>'a" (fn [] (grapple.toggle)))
(map! [n] "<leader>''" (fn [] (grapple.toggle_tags)))
(map! [n] :<A-n> (fn [] (grapple.select {:index 1})))
(map! [n] :<A-e> (fn [] (grapple.select {:index 2})))
(map! [n] :<A-i> (fn [] (grapple.select {:index 3})))
(map! [n] :<A-o> (fn [] (grapple.select {:index 4})))
