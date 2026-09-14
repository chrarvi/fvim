(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :kylechui/nvim-surround)])
(require-and :nvim-surround #($.setup {}))
