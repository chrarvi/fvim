(local {: require-and : gh} (require :functions))

(vim.pack.add [(gh :nvim-lua/plenary.nvim) (gh :chrarvi/cmp-jira-issues.nvim)])

(require-and :cmp-jira-issues #($.setup {}))
