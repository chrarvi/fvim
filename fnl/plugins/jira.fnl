(local M {1 :christoffer-arvidsson/cmp-jira-issues.nvim
       :dependencies [:nvim-lua/plenary.nvim :hrsh7th/nvim-cmp]})

(fn M.config []
  (local jira (require :cmp-jira-issues))
  (jira.setup {}))

M
