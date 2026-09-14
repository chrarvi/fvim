(import-macros {: map!} :hibiscus.vim)
(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :mbbill/undotree)])

(map! [n] :<leader>ou vim.cmd.UndotreeToggle)
